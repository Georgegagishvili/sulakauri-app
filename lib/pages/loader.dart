import 'dart:async';
import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sulakauri/pages/home.dart';
import 'package:sulakauri/util/cache.dart';
import 'package:sulakauri/util/preferences.dart';
import 'package:sulakauri/util/route_animations.dart';
import '../theme/apptheme.dart';

class _LoadingPageState extends State<LoadingPage> {
  double opacityLevel = 0.0;
  late final Timer _delayedNetworkTimer;
  late final Timer _minimumDelayTimer;
  bool minimumTimerExpired = false;
  bool loadingSequenceCompleted = false;

  @override
  void initState() {
    super.initState();

    loadSequence();
  }

  @override
  void dispose() {
    _delayedNetworkTimer.cancel();
    _minimumDelayTimer.cancel();
    super.dispose();
  }

  void _showDelayedLoadingNotice() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  Future<dynamic> loadSequence() async {
    try {
      _delayedNetworkTimer =
          Timer(const Duration(seconds: 3), onDelayedLoading);
      _minimumDelayTimer =
          Timer(const Duration(milliseconds: 1600), onMinimumTimerExpire);

      await initInternalServices();
      await initConfig();

      onLoadingSequenceCompleted();
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  onDelayedLoading() async {
    _showDelayedLoadingNotice();
  }

  onMinimumTimerExpire() {
    minimumTimerExpired = true;
    onDoneLoading();
  }

  onLoadingSequenceCompleted() {
    loadingSequenceCompleted = true;
    onDoneLoading();
  }

  onDoneLoading() async {
    if (loadingSequenceCompleted && minimumTimerExpired) {
      navigateToHome();
    }
  }

  navigateToHome() async {
    Navigator.of(context).pushReplacement(
      HybridRouteAnimations(
        const HomePage(),
        // const OnBoardingPage(),
        SharedAxisTransitionType.scaled,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.orange.withOpacity(0.3),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 62,
                child: SvgPicture.asset('assets/svg/sun.svg'),
              ),
              const SizedBox(height: 20),
              Text(
                'parks.ge',
                style: AppTheme.twenty.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              AnimatedOpacity(
                opacity: opacityLevel,
                duration: const Duration(milliseconds: 200),
                child: const Padding(
                  padding: EdgeInsets.only(top: 56),
                  child: CircularProgressIndicator(
                      // color: AppTheme.lightModePrimaryColor,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  initInternalServices() async {
    AppGenericCache.create();

    final prefs = await SharedPreferences.getInstance();

    Preferences.create(prefs);
  }

  initConfig() async {}
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State createState() => _LoadingPageState();
}
