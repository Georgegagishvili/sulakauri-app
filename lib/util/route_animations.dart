import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class HybridRouteAnimations extends PageRoute {
  HybridRouteAnimations(this.page, this.type);

  final Widget page;
  final SharedAxisTransitionType type;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return page;
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return Platform.isIOS
        ? const CupertinoPageTransitionsBuilder().buildTransitions(
        this, context, animation, secondaryAnimation, child)
        : SharedAxisPageTransitionsBuilder(transitionType: type)
        .buildTransitions(
        this, context, animation, secondaryAnimation, child);
  }
}

class SharedAxisRouteAnimations extends PageRouteBuilder {
  final Widget page;

  SharedAxisRouteAnimations(this.page, SharedAxisTransitionType type)
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: type,
          child: child,
        ),
  );
}

class FadeThroughRouteAnimations extends PageRouteBuilder {
  final Widget page;

  FadeThroughRouteAnimations(this.page)
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
  );
}
