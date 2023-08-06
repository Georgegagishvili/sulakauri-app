import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:sulakauri/providers/reading_provider.dart';
import 'package:sulakauri/theme/apptheme.dart';
import 'package:sulakauri/util/helper.dart';
import 'package:sulakauri/widgets/appbars/reading_appbar.dart';
import 'package:sulakauri/widgets/other/rating.dart';

class _ReadingPageState extends State<ReadingPage> {
  final DraggableScrollableController _scrollController =
      DraggableScrollableController();
  final ValueNotifier<int> _page = ValueNotifier(0);
  final ValueNotifier<double> _sheetSize = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _sheetSize.value = _scrollController.size;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _sheetSize.dispose();
    _scrollController.dispose();
    _page.dispose();
  }

  void _updateSheetSize() {
    if (_scrollController.size < 1) {
      _scrollController.animateTo(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      _scrollController.animateTo(
        0.85,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: ValueListenableBuilder(
          valueListenable: _sheetSize,
          builder: (_, __, ___) {
            return AnimatedOpacity(
                opacity: _sheetSize.value > 0.9 ? 0 : 1,
                duration: const Duration(milliseconds: 300),
                child: const ReadingAppbar());
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Consumer<ReadingProvider>(
        builder: (context, readingProvider, __) {
          return DraggableScrollableSheet(
            maxChildSize: 1,
            minChildSize: 0.6,
            initialChildSize: 0.85,
            snapSizes: const [0.85, 1],
            snap: true,
            controller: _scrollController,
            builder: (context, controller) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.black.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 3,
                    )
                  ],
                  color: readingProvider.getSheetTheme.background,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  child: GestureDetector(
                    onTap: () => _updateSheetSize(),
                    child: ListView(
                      shrinkWrap: true,
                      controller: controller,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
                      children: [
                        const Text(
                          'Harry Potter',
                          style: AppTheme.twenty,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'J. K. Rowling',
                          style: AppTheme.fourteen.copyWith(
                            color: AppTheme.silver,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () => readingProvider.updateFontSize(-1),
                          child: const RatingBuilder(
                            rating: 5,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          Helper.lorem * 50,
                          textAlign: readingProvider.getTextAlignment,
                          style: AppTheme.fourteen.copyWith(
                            fontSize: readingProvider.getFontSize,
                            color: readingProvider.getSheetTheme.text,
                            height: readingProvider.getLineSpacing /
                                readingProvider.getFontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ReadingPage extends StatefulWidget {
  const ReadingPage({Key? key}) : super(key: key);

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class PagingText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const PagingText(
    this.text, {
    this.style = AppTheme.fourteen,
    Key? key,
  }) : super(key: key);

  @override
  PagingTextState createState() => PagingTextState();
}

class PagingTextState extends State<PagingText> {
  final List<String> _pageTexts = [];
  bool _needPaging = true;
  bool _isPaging = false;
  final _pageKey = GlobalKey();

  @override
  void didUpdateWidget(PagingText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.text != oldWidget.text) {
      setState(() {
        _pageTexts.clear();
        _needPaging = true;
        _isPaging = false;
      });
    }
  }

  void _paginate() {
    final pageSize =
        (_pageKey.currentContext?.findRenderObject() as RenderBox).size;

    _pageTexts.clear();

    final textSpan = TextSpan(
      text: widget.text,
      style: widget.style,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: pageSize.width,
    );

    List<LineMetrics> lines = textPainter.computeLineMetrics();
    double currentPageBottom = pageSize.height - 50;
    int currentPageStartIndex = 0;
    int currentPageEndIndex = 0;

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];

      final left = line.left;
      final top = line.baseline - line.ascent;
      final bottom = line.baseline + line.descent;

      if (currentPageBottom < bottom) {
        currentPageEndIndex =
            textPainter.getPositionForOffset(Offset(left, top)).offset;
        final pageText =
            widget.text.substring(currentPageStartIndex, currentPageEndIndex);
        _pageTexts.add(pageText);

        currentPageStartIndex = currentPageEndIndex;
        currentPageBottom = top + pageSize.height;
      }
    }

    final lastPageText = widget.text.substring(currentPageStartIndex);
    _pageTexts.add(lastPageText);

    setState(() {
      _needPaging = false;
      _isPaging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_needPaging && !_isPaging) {
      _isPaging = true;

      SchedulerBinding.instance.addPostFrameCallback((_) {
        _paginate();
      });
    }

    return Stack(
      children: [
        PageView.builder(
          key: _pageKey,
          itemCount: _pageTexts.length,
          itemBuilder: (context, idx) {
            return SizedBox(
              child: SelectableText(
                _isPaging ? ' ' : _pageTexts[idx],
                style: widget.style,
              ),
            );
          },
        ),
        if (_isPaging)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
