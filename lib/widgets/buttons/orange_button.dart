import 'package:flutter/material.dart';
import 'package:sulakauri/theme/apptheme.dart';

class _OrangeButtonState extends State<OrangeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Feedback.forTap(context);
        widget.onClick?.call();
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 200,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 29,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          boxShadow: [AppTheme.primaryShadow],
          color: AppTheme.darkOrange,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          widget.label,
          textAlign: TextAlign.center,
          style: AppTheme.sixteen.copyWith(
            color: AppTheme.white,
            height: 1
          ),
        ),
      ),
    );
  }
}

class OrangeButton extends StatefulWidget {
  const OrangeButton({
    required this.label,
    this.onClick,
    Key? key,
  }) : super(key: key);
  final String label;
  final VoidCallback? onClick;

  @override
  State<OrangeButton> createState() => _OrangeButtonState();
}
