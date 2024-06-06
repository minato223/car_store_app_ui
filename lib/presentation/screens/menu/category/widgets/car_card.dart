// ignore_for_file: must_be_immutable

import 'package:car_store_app_ui/core/constants/app_color.dart';
import 'package:car_store_app_ui/core/constants/app_size.dart';
import 'package:car_store_app_ui/presentation/routes/arguments.dart';
import 'package:car_store_app_ui/presentation/routes/routes.dart';
import 'package:car_store_app_ui/presentation/screens/models/vehicle.dart';
import 'package:car_store_app_ui/presentation/widgets/completes/translate_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarCard extends StatelessWidget {
  Vehicle vehicle;
  bool isActive;
  Function(Vehicle vehicle)? onTapCallback;
  CarCard(
      {super.key,
      required this.vehicle,
      required this.isActive,
      this.onTapCallback});

  void goToDetail(Vehicle vehicle) {
    Get.toNamed(Routes.detailPage, arguments: {Arguments.vehicleKey: vehicle});
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSize size = AppSize(context);
    return GestureDetector(
      onTap: () {
        onTapCallback?.call(vehicle);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        clipBehavior: Clip.hardEdge,
        width: size.width,
        margin: EdgeInsets.fromLTRB(size.medium, 0, size.medium, size.medium),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: isActive
                ? const [
                    BoxShadow(
                        color: AppColor.primaryColor,
                        blurRadius: 0,
                        spreadRadius: 1,
                        offset: Offset(2, 2))
                  ]
                : null,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: AppColor.primaryColor.withOpacity(isActive ? 1 : .2),
                width: isActive ? 2 : 1)),
        child: Stack(
          children: [
            TweenAnimationBuilder(
                curve: Curves.decelerate,
                tween: Tween<double>(begin: 30, end: 0),
                duration: const Duration(milliseconds: 1000),
                builder: (context, value, child) {
                  return TranslateAnimation(
                      animationValue: value,
                      direction: TranslateAnimationDirection.x,
                      offsetY: 30,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 001)
                          ..translate(size.width * .3),
                        child: Image.asset(
                          vehicle.image,
                          width: size.width * .7,
                        ),
                      ));
                }),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: size.width * .7,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.large, horizontal: size.medium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: vehicle.name,
                          child: Text(
                            vehicle.name,
                            style: theme.textTheme.titleLarge?.copyWith(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: size.small),
                        Text(
                          "Free 7 day return",
                          style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.textGrayColor),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        goToDetail(vehicle);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: size.small, horizontal: size.medium),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                                color: AppColor.primaryColor,
                                blurRadius: 0,
                                spreadRadius: 1,
                                offset: Offset(2, 2))
                          ],
                          border: Border.all(
                            color: AppColor.primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Inside",
                              style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.primaryColor),
                            ),
                            SizedBox(width: size.small * .5),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: AppColor.primaryColor,
                            )
                          ],
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
    );
  }
}
