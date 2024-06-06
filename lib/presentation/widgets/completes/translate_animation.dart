// ignore_for_file: must_be_immutable

import 'package:car_store_app_ui/presentation/animations/welcome_animation.dart';
import 'package:flutter/material.dart';

class TranslateAnimation extends StatelessWidget {
  TranslateAnimation(
      {super.key,
      required this.child,
      required this.animationValue,
      this.offsetY = WelcomeAnimation.offsetY,
      this.direction});
  TranslateAnimationDirection? direction;
  final Widget child;
  final double animationValue;
  double offsetY;
  @override
  Widget build(BuildContext context) {
    double opacity = ((animationValue / offsetY) - 1) * (-1);
    Offset offset = Offset(0, animationValue);
    if (direction == TranslateAnimationDirection.x) {
      // int multiply = 1;
      // if (offsetY) {

      // }
      offset = Offset(animationValue, 0);
      opacity = ((-animationValue / offsetY) + 1);
    }
    return Transform.translate(
      offset: offset,
      child: Opacity(opacity: opacity, child: child),
    );
  }
}

enum TranslateAnimationDirection { x, y }
