// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:car_store_app_ui/core/constants/app_color.dart';
import 'package:car_store_app_ui/core/constants/app_constant.dart';
import 'package:car_store_app_ui/core/constants/app_image.dart';
import 'package:car_store_app_ui/core/constants/app_size.dart';
import 'package:car_store_app_ui/presentation/animations/detail_animation.dart';
import 'package:car_store_app_ui/presentation/routes/arguments.dart';
import 'package:car_store_app_ui/presentation/screens/models/vehicle.dart';
import 'package:car_store_app_ui/presentation/widgets/elements/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

List<String> menus = ["Details", "Features"];

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _roadAnimationController;
  late DetailAnimation _detailAnimation;
  late Vehicle vehicle;
  String currentMenu = menus[0];
  bool roadVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _roadAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _detailAnimation = DetailAnimation(_animationController);
    vehicle = Get.arguments[Arguments.vehicleKey];
    _animationController.forward();
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        startRoadAnimation();
      }
    });
  }

  void startRoadAnimation() {
    setState(() {
      roadVisible = true;
    });
    _roadAnimationController.repeat();
  }

  void toggle(String menu) {
    setState(() {
      currentMenu = menu;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _roadAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSize size = AppSize(context);
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: Stack(
        children: [
          ListView(
            children: [
              AnimatedBuilder(
                animation: _roadAnimationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                        0, -size.height * _roadAnimationController.value),
                    child: Column(
                      children: List.generate(30, (index) {
                        return Container(
                          color: Colors.grey.withOpacity(.3),
                          width: size.width * .1,
                          height: size.width * .1,
                          margin: EdgeInsets.only(bottom: size.large),
                        );
                      }),
                    ),
                  );
                },
              ),
            ],
          ),
          Container(height: size.height * .2, color: AppColor.secondaryColor),
          Column(
            children: [
              Container(
                height: size.height * .45,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(),
                child: SafeArea(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(size.medium),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back_ios_new_rounded,
                                color: AppColor.primaryColor),
                          ),
                          Expanded(
                            child: Hero(
                              tag: vehicle.name,
                              child: Text(
                                vehicle.name,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.titleLarge?.copyWith(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const Icon(Icons.ios_share_rounded,
                              color: AppColor.primaryColor),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Stack(
                      children: [
                        roadBorderBuilder(
                            alignment: const Alignment(-.3, 0), angle: pi / 20),
                        roadBorderBuilder(
                            alignment: const Alignment(.3, 0), angle: -pi / 20),
                        Positioned.fill(
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      color: AppColor.secondaryColor)),
                              const Expanded(flex: 1, child: SizedBox())
                            ],
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.all(size.width * .1),
                                child: Transform(
                                    transform: Matrix4.identity()
                                      ..setEntry(3, 2, 001)
                                      ..scale(_detailAnimation
                                          .carScaleAnimation.value)
                                      ..translate(
                                          0.0,
                                          _detailAnimation
                                              .carTranslateAnimation.value),
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(AppImage.detail2)),
                              ),
                            );
                          },
                        )
                      ],
                    ))
                  ],
                )),
              ),
              Expanded(
                  child: Container(
                color: AppColor.primaryColor,
                child: ListView(
                  children: [
                    SizedBox(
                      height: size.height * .15,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding:
                              EdgeInsets.symmetric(horizontal: size.medium),
                          itemBuilder: (context, index) {
                            bool isActive = index == 0;
                            return Container(
                              width: size.width * .3,
                              padding: EdgeInsets.all(size.medium),
                              decoration: BoxDecoration(
                                  boxShadow:
                                      isActive ? AppConstant.innerShadow : null,
                                  border: Border.all(
                                      color: Colors.white12,
                                      width: isActive ? 2 : 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: SvgPicture.asset(
                                      AppConstant.tabItems[index].icone,
                                      width: size.width * .07,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    AppConstant.tabItems[index].name,
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    style: theme.textTheme.titleSmall?.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            AppColor.scaffoldBackgroundColor),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: size.medium);
                          },
                          itemCount: AppConstant.tabItems.length),
                    ),
                    SizedBox(height: size.large),
                    Container(
                      width: size.width * .3,
                      padding: EdgeInsets.all(size.small),
                      margin: EdgeInsets.symmetric(horizontal: size.medium),
                      decoration: BoxDecoration(
                          boxShadow: AppConstant.innerShadow,
                          border: Border.all(color: Colors.white12, width: 2),
                          borderRadius: BorderRadius.circular(50)),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: AnimatedAlign(
                              duration: const Duration(milliseconds: 400),
                              alignment: currentMenu == menus[0]
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Container(
                                width: (size.width - (size.medium * 3)) / 2,
                                decoration: BoxDecoration(
                                    color: AppColor.scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                          ),
                          Row(
                            children: menus.asMap().entries.map((entry) {
                              return Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      toggle(entry.value);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(size.small),
                                      child: Text(
                                        entry.value,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: theme.textTheme.titleSmall
                                            ?.copyWith(
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w600,
                                                color: currentMenu ==
                                                        entry.value
                                                    ? AppColor.primaryColor
                                                    : AppColor
                                                        .scaffoldBackgroundColor),
                                      ),
                                    ),
                                  ));
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.medium),
                    Column(
                      children: AppConstant.vehicleOptionItems.map((el) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: size.medium),
                              margin: EdgeInsets.fromLTRB(
                                  size.medium, 0, size.medium, size.medium),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: AppColor
                                              .scaffoldBackgroundColor
                                              .withOpacity(.2)))),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          el.icone,
                                          color:
                                              AppColor.scaffoldBackgroundColor,
                                        ),
                                        SizedBox(width: size.small),
                                        Text(
                                          el.attribute,
                                          maxLines: 2,
                                          style: theme.textTheme.titleSmall
                                              ?.copyWith(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor
                                                      .scaffoldBackgroundColor),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    el.value,
                                    maxLines: 2,
                                    style: theme.textTheme.titleSmall?.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            AppColor.scaffoldBackgroundColor),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      }).toList(),
                    )
                  ],
                ),
              ))
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: size.medium),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.medium * .75),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primaryColor,
                boxShadow: const [
                  BoxShadow(
                      color: AppColor.scaffoldBackgroundColor,
                      blurRadius: 0,
                      spreadRadius: 1,
                      offset: Offset(2, 2))
                ],
                border: Border.all(
                  color: AppColor.scaffoldBackgroundColor,
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.favorite_outline_rounded,
                color: AppColor.scaffoldBackgroundColor,
              ),
            ),
            Expanded(child: SecondaryButton(text: "Get started"))
          ],
        ),
      ),
    );
  }

  Widget roadBorderBuilder(
      {required AlignmentGeometry alignment, required double angle}) {
    return Builder(
      builder: (context) {
        AppSize size = AppSize(context);
        return AnimatedOpacity(
          opacity: roadVisible ? 1 : 0,
          duration: const Duration(milliseconds: 400),
          child: Align(
            alignment: alignment,
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 001)
                ..rotateZ(angle)
                ..translate(0.0, 10),
              alignment: Alignment.topCenter,
              child: Container(
                color: Colors.grey.withOpacity(.3),
                width: size.width * .1,
              ),
            ),
          ),
        );
      },
    );
  }
}
