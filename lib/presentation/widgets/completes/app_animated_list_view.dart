// ignore_for_file: must_be_immutable, empty_catches, library_private_types_in_public_api

import 'package:car_store_app_ui/core/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

enum AppAnimationStart { left, right, top, bottom }

enum AppAnimationType { transition, scale }

class AppAnimatedListView extends StatefulWidget {
  List<Widget> widgets;
  AppAnimationStart animationStart;
  AppAnimationType? animationType;
  EdgeInsetsGeometry? contentPadding;
  Duration? startAnimationDelay;
  Function? onRefresh;
  Axis? scrollDirection;
  bool withOpacity;
  AppAnimatedListView(
      {super.key,
      required this.animationStart,
      required this.widgets,
      this.animationType = AppAnimationType.transition,
      this.onRefresh,
      this.contentPadding,
      this.scrollDirection,
      this.withOpacity = false,
      this.startAnimationDelay});

  @override
  _AppAnimatedListViewState createState() => _AppAnimatedListViewState();
}

class _AppAnimatedListViewState extends State<AppAnimatedListView> {
  final GlobalKey<AnimatedListState> _globalKey =
      GlobalKey<AnimatedListState>();
  late Tween<Offset> _tween;
  List<Widget> items = [];

  @override
  void initState() {
    super.initState();
    switch (widget.animationStart) {
      case AppAnimationStart.left:
        _tween =
            Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0));
        break;
      case AppAnimationStart.top:
        _tween =
            Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0));
        break;
      case AppAnimationStart.right:
        _tween =
            Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0));
        break;
      case AppAnimationStart.bottom:
        _tween =
            Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0));
        break;
      default:
    }
    if (widget.startAnimationDelay != null &&
        widget.startAnimationDelay != Duration.zero) {
      Future.delayed(widget.startAnimationDelay!, () {
        addWidgets();
      });
    } else {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        addWidgets();
      });
    }
  }

  int delay = 250;
  int step = 50;
  void addWidgets() {
    if (widget.widgets.isNotEmpty) {
      Future future = Future(() {});
      for (var item in widget.widgets) {
        future = future.then((_) {
          if (delay - step >= 0) {
            delay -= step;
          }
          return Future.delayed(Duration(milliseconds: delay), () {
            addItem(item);
          });
        });
      }
    }
  }

  void addItem(Widget item) {
    int index = items.length;
    items.insert(index, item);
    try {
      _globalKey.currentState!.insertItem(index);
    } catch (e) {}
  }

  void removeElement(int id) {}

  @override
  void dispose() {
    _globalKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppSize size = AppSize(context);
    Widget child = AnimatedList(
        scrollDirection: widget.scrollDirection ?? Axis.vertical,
        physics:
            widget.onRefresh != null ? null : const BouncingScrollPhysics(),
        key: _globalKey,
        initialItemCount: items.length,
        padding: widget.contentPadding ?? EdgeInsets.all(size.medium),
        itemBuilder: ((context, index, animation) {
          if (widget.animationType == AppAnimationType.scale) {
            return ScaleTransition(
                scale: animation.drive(Tween<double>(begin: 0, end: 1)),
                child: items[index]);
          }
          return SlideTransition(
            position: animation.drive(_tween),
            child: items[index],
          );
        }));
    return Scaffold(
        body: widget.onRefresh != null
            ? RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 2));
                  widget.onRefresh!();
                },
                child: child,
              )
            : child);
  }
}
