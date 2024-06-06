// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/animation.dart';

class DetailAnimation {
  late AnimationController _controller;

  Animation<double> carScaleAnimation;
  Animation<double> carTranslateAnimation;
  DetailAnimation(this._controller)
      : carScaleAnimation = Tween<double>(begin: 1.3, end: 1.1).animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(0, .6, curve: Curves.decelerate))),
        carTranslateAnimation = Tween<double>(begin: 0, end: -30).animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(.5, 1, curve: Curves.decelerate)));
}
