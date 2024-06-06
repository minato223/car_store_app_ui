// ignore_for_file: deprecated_member_use

import 'package:car_store_app_ui/core/constants/app_color.dart';
import 'package:car_store_app_ui/core/constants/app_constant.dart';
import 'package:car_store_app_ui/core/constants/app_image.dart';
import 'package:car_store_app_ui/core/constants/app_size.dart';
import 'package:car_store_app_ui/core/constants/app_svg.dart';
import 'package:car_store_app_ui/presentation/animations/home_animation.dart';
import 'package:car_store_app_ui/presentation/animations/welcome_animation.dart';
import 'package:car_store_app_ui/presentation/screens/models/budget_model.dart';
import 'package:car_store_app_ui/presentation/widgets/completes/translate_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late HomeAnimation _homeAnimation;
  late AnimationController _controller;
  BudgetModel? currentBudgetModel;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _homeAnimation = HomeAnimation(_controller);
    _controller.forward();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        updateCurrentBudgetModel(AppConstant.budgetModels[1]);
      }
    });
  }

  updateCurrentBudgetModel(BudgetModel model) {
    setState(() {
      currentBudgetModel = model;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSize size = AppSize(context);
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Column(
            children: [
              Container(
                height:
                    size.height * .35 * _homeAnimation.headerAnimation.value,
                width: size.width,
                decoration: const BoxDecoration(color: AppColor.primaryColor),
                child: Stack(
                  children: [
                    Positioned(
                      width: size.width,
                      bottom: -30,
                      child: SvgPicture.asset(
                        AppSvg.frame,
                        color: AppColor.scaffoldBackgroundColor.withOpacity(.1),
                      ),
                    ),
                    TranslateAnimation(
                      animationValue: _homeAnimation.carAnimation.value,
                      direction: TranslateAnimationDirection.x,
                      offsetY: -WelcomeAnimation.offsetY,
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            AppImage.car6,
                            width: size.width * .9,
                          )),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(size.medium),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 1, child: SizedBox(height: size.medium)),
                            Expanded(
                              flex: 3,
                              child: TranslateAnimation(
                                animationValue:
                                    _homeAnimation.titleAnimation.value,
                                child: Text(
                                  "Winter Sale",
                                  style: theme.textTheme.titleLarge?.copyWith(
                                      color: AppColor.scaffoldBackgroundColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 12,
                              child: TranslateAnimation(
                                animationValue:
                                    _homeAnimation.subtitleAnimation.value,
                                child: Text(
                                  "Save up to \$20 \non sale snakers",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                      color: AppColor.scaffoldBackgroundColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.fromLTRB(
                    size.medium, size.medium, size.medium, 0),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TranslateAnimation(
                          animationValue:
                              _homeAnimation.categoryTitleAnimation.value,
                          direction: TranslateAnimationDirection.x,
                          child: Text(
                            "Shop by Car type",
                            style: theme.textTheme.titleLarge?.copyWith(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      TranslateAnimation(
                        animationValue:
                            _homeAnimation.categoryTitleIconAnimation.value,
                        direction: TranslateAnimationDirection.x,
                        offsetY: -WelcomeAnimation.offsetY,
                        child: Container(
                            padding: EdgeInsets.all(size.small),
                            decoration: BoxDecoration(
                                color: AppColor.scaffoldBackgroundColor,
                                shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                      color: AppColor.primaryColor,
                                      blurRadius: 0,
                                      spreadRadius: 1,
                                      offset: Offset(2, 2))
                                ],
                                border: Border.all(
                                    color: AppColor.primaryColor, width: 2)),
                            child: const Icon(
                              Icons.arrow_forward_rounded,
                              color: AppColor.primaryColor,
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: size.medium),
                  TranslateAnimation(
                    animationValue:
                        _homeAnimation.categoryContentAnimation.value,
                    offsetY: -WelcomeAnimation.offsetY,
                    child: SizedBox(
                      height: size.width * .3,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            bool isActive = index == 0;
                            return Column(
                              children: [
                                Container(
                                  height: size.width * .2,
                                  width: size.width * .2,
                                  padding: EdgeInsets.all(size.small),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.scaffoldBackgroundColor,
                                      boxShadow: isActive
                                          ? const [
                                              BoxShadow(
                                                  color: AppColor.primaryColor,
                                                  blurRadius: 0,
                                                  spreadRadius: 1,
                                                  offset: Offset(2, 2))
                                            ]
                                          : null,
                                      border: Border.all(
                                        color: AppColor.primaryColor
                                            .withOpacity(isActive ? 1 : .2),
                                        width: isActive ? 2 : 1,
                                      )),
                                  child: SvgPicture.asset(
                                      "${AppSvg.basePath}/car${index + 1}.svg"),
                                ),
                                SizedBox(height: size.small),
                                Text(
                                  AppConstant.vehicleBrands[index],
                                  style: theme.textTheme.titleMedium?.copyWith(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: size.small);
                          },
                          itemCount: AppConstant.vehicleBrands.length),
                    ),
                  ),
                  SizedBox(height: size.medium),
                  TranslateAnimation(
                    animationValue: _homeAnimation.budgetTitleAnimation.value,
                    offsetY: -WelcomeAnimation.offsetY,
                    child: Text(
                      "Shop by Budget",
                      style: theme.textTheme.titleLarge?.copyWith(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: size.medium),
                  Row(
                    children: [
                      animatedBudgetTile(
                          budgetModel: AppConstant.budgetModels[0],
                          animation: _homeAnimation.budgetUnderAnimation.value),
                      SizedBox(width: size.medium),
                      animatedBudgetTile(
                          budgetModel: AppConstant.budgetModels[1],
                          animation: _homeAnimation.budgetFromAnimation.value),
                      SizedBox(width: size.medium),
                      animatedBudgetTile(
                          budgetModel: AppConstant.budgetModels[2],
                          animation: _homeAnimation.budgetOverAnimation.value),
                    ],
                  ),
                ],
              ))
            ],
          );
        },
      ),
    );
  }

  Widget animatedBudgetTile(
      {required BudgetModel budgetModel, required double animation}) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          updateCurrentBudgetModel(budgetModel);
        },
        child: Transform.scale(
          scale: animation,
          child: byBudgetCardBuilder(
              title: budgetModel.title,
              subtitle: budgetModel.ratio,
              isActive: currentBudgetModel == budgetModel),
        ),
      ),
    );
  }

  Widget byBudgetCardBuilder(
      {required String title,
      required String subtitle,
      bool isActive = false}) {
    return Builder(builder: (context) {
      ThemeData theme = Theme.of(context);
      AppSize size = AppSize(context);
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(size.medium),
        decoration: BoxDecoration(
            color: AppColor.scaffoldBackgroundColor,
            boxShadow: isActive
                ? const [
                    BoxShadow(
                        color: AppColor.primaryColor,
                        blurRadius: 0,
                        spreadRadius: 1,
                        offset: Offset(2, 2))
                  ]
                : null,
            border: Border.all(
              color: AppColor.primaryColor.withOpacity(isActive ? 1 : .2),
              width: isActive ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                    color: AppColor.textGrayColor.withOpacity(.5),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: size.medium),
            FittedBox(
              child: Text(
                subtitle,
                style: theme.textTheme.titleLarge?.copyWith(
                    color: AppColor.textColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    });
  }
}
