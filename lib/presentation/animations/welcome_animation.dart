// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/animation.dart';

class WelcomeAnimation {
  static const offsetY = -10.0;
  late AnimationController _controller;
  static Tween<double> forwardBooleanTween = Tween<double>(begin: 0, end: 1);
  static Tween<double> backwardBooleanTween = Tween<double>(begin: 1, end: 0);
  static Tween<double> offsetYTweenP = Tween<double>(begin: offsetY, end: 0);
  static Tween<double> offsetYTweenN = Tween<double>(begin: -offsetY, end: 0);
  Animation<double> frameAnimation;
  Animation<double> carAnimation;
  Animation<double> titleAnimation;
  Animation<double> subtitleAnimation;
  Animation<double> lookingTextAnimation;
  Animation<double> primaryButtonAnimation;
  Animation<double> transparentButtonAnimation;
  WelcomeAnimation(this._controller)
      : frameAnimation = backwardBooleanTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(0, .5, curve: Curves.easeIn))),
        carAnimation = backwardBooleanTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.4, .6, curve: Curves.elasticOut))),
        titleAnimation = offsetYTweenP.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.5, .6, curve: Curves.decelerate))),
        subtitleAnimation = offsetYTweenP.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.6, .7, curve: Curves.bounceOut))),
        lookingTextAnimation = offsetYTweenN.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.7, .8, curve: Curves.decelerate))),
        primaryButtonAnimation = offsetYTweenN.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.7, .9, curve: Curves.decelerate))),
        transparentButtonAnimation = offsetYTweenN.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.8, 1, curve: Curves.decelerate)));
}
