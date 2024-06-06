import 'package:car_store_app_ui/core/constants/app_color.dart';
import 'package:car_store_app_ui/core/constants/app_constant.dart';
import 'package:car_store_app_ui/core/constants/app_image.dart';
import 'package:car_store_app_ui/core/constants/app_size.dart';
import 'package:car_store_app_ui/core/constants/app_svg.dart';
import 'package:car_store_app_ui/core/functions/funtions.dart';
import 'package:car_store_app_ui/presentation/animations/welcome_animation.dart';
import 'package:car_store_app_ui/presentation/routes/routes.dart';
import 'package:car_store_app_ui/presentation/widgets/completes/translate_animation.dart';
import 'package:car_store_app_ui/presentation/widgets/elements/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  late WelcomeAnimation _welcomeAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    _welcomeAnimation = WelcomeAnimation(_controller);
    _controller.forward();
  }

  void goToMenuPage() {
    Get.toNamed(Routes.menuPage);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSize size = AppSize(context);
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 001)
                          ..scale(1.3),
                        child: SvgPicture.asset(
                          AppSvg.frame,
                        )),
                  ),
                  Opacity(
                    opacity: reverseAnimationValue(
                        _welcomeAnimation.frameAnimation.value),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width:
                            size.width * _welcomeAnimation.frameAnimation.value,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SafeArea(
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: size.large),
                            TranslateAnimation(
                              animationValue:
                                  _welcomeAnimation.titleAnimation.value,
                              child: Text(
                                "M-corp",
                                style: theme.textTheme.displayMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.secondaryLightColor),
                              ),
                            ),
                            SizedBox(height: size.medium),
                            SizedBox(
                              width: size.width * .7,
                              child: TranslateAnimation(
                                animationValue:
                                    _welcomeAnimation.subtitleAnimation.value,
                                child: Text(
                                  "Sint ex eu voluptate tempor quis amet ut commodo aute. Aute aute nulla commodo pariatur.",
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                      height: 1.8,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 001)
                              ..translate(size.width *
                                  _welcomeAnimation.carAnimation.value),
                            child: Opacity(
                                opacity: reverseAnimationValue(
                                    _welcomeAnimation.carAnimation.value),
                                child: Image.asset(AppImage.presentation)))),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TranslateAnimation(
                              animationValue:
                                  _welcomeAnimation.lookingTextAnimation.value,
                              offsetY: -WelcomeAnimation.offsetY,
                              child: Text(
                                "I'm looking to:",
                                textAlign: TextAlign.center,
                                style: theme.textTheme.titleMedium?.copyWith(
                                    height: 1.8,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(height: size.medium),
                            TranslateAnimation(
                              animationValue: _welcomeAnimation
                                  .primaryButtonAnimation.value,
                              offsetY: -WelcomeAnimation.offsetY,
                              child: PrimaryButton(
                                  text: "Buy a car", ontap: goToMenuPage),
                            ),
                            SizedBox(height: size.medium),
                            TranslateAnimation(
                              animationValue: _welcomeAnimation
                                  .transparentButtonAnimation.value,
                              offsetY: -WelcomeAnimation.offsetY,
                              child: GestureDetector(
                                onTap: goToMenuPage,
                                child: Container(
                                  width: size.width,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.medium),
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.small * 1.5),
                                  decoration: BoxDecoration(
                                      boxShadow: AppConstant.innerShadow,
                                      border: Border.all(
                                          color: AppColor.primaryColor,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text(
                                    "Scale a car",
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                            height: 1.8,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor
                                                .scaffoldBackgroundColor),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: size.large)
                          ],
                        ))
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
