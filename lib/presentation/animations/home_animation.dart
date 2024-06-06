// ignore_for_file: prefer_final_fields, unused_field

import 'package:car_store_app_ui/presentation/animations/welcome_animation.dart';
import 'package:flutter/animation.dart';

class HomeAnimation {
  static const offsetY = -10.0;
  late AnimationController _controller;

  Animation<double> headerAnimation;
  Animation<double> titleAnimation;
  Animation<double> subtitleAnimation;
  Animation<double> carAnimation;
  Animation<double> categoryTitleAnimation;
  Animation<double> categoryTitleIconAnimation;
  Animation<double> categoryContentAnimation;
  Animation<double> budgetTitleAnimation;
  Animation<double> budgetUnderAnimation;
  Animation<double> budgetFromAnimation;
  Animation<double> budgetOverAnimation;
  HomeAnimation(this._controller)
      : headerAnimation = WelcomeAnimation.forwardBooleanTween.animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(0, .2, curve: Curves.elasticOut))),
        titleAnimation = WelcomeAnimation.offsetYTweenP.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.1, .2, curve: Curves.decelerate))),
        subtitleAnimation = WelcomeAnimation.offsetYTweenP.animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(.2, .3, curve: Curves.decelerate))),
        carAnimation = WelcomeAnimation.offsetYTweenN.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.3, .4, curve: Curves.bounceOut))),
        categoryTitleAnimation = WelcomeAnimation.offsetYTweenP.animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(.4, .5, curve: Curves.easeOut))),
        categoryTitleIconAnimation = WelcomeAnimation.offsetYTweenN.animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(.4, .5, curve: Curves.easeOut))),
        categoryContentAnimation = WelcomeAnimation.offsetYTweenN.animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(.5, .6, curve: Curves.easeOut))),
        budgetTitleAnimation = WelcomeAnimation.offsetYTweenN.animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(.6, .7, curve: Curves.decelerate))),
        budgetUnderAnimation = WelcomeAnimation.forwardBooleanTween.animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(.7, .8, curve: Curves.bounceOut))),
        budgetFromAnimation = WelcomeAnimation.forwardBooleanTween.animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(.8, .9, curve: Curves.bounceOut))),
        budgetOverAnimation = WelcomeAnimation.forwardBooleanTween.animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(.9, 1, curve: Curves.bounceOut)));
}
