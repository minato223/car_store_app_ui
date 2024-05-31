import 'package:car_store_app_ui/core/constants/app_color.dart';
import 'package:car_store_app_ui/core/constants/app_constant.dart';
import 'package:car_store_app_ui/core/constants/app_image.dart';
import 'package:car_store_app_ui/core/constants/app_size.dart';
import 'package:car_store_app_ui/core/constants/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSize size = AppSize(context);
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: Column(
        children: [
          Container(
            height: size.height * .35,
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
                Positioned(
                    right: 0,
                    bottom: -10,
                    child: Image.asset(
                      AppImage.car6,
                      width: size.width * .9,
                    )),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(size.medium),
                    child: Column(
                      children: [
                        SizedBox(height: size.medium),
                        Text(
                          "Winter Sale",
                          style: theme.textTheme.titleLarge?.copyWith(
                              color: AppColor.scaffoldBackgroundColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.medium),
                        Text(
                          "Save up to \$20 \non sale snakers",
                          style: theme.textTheme.titleMedium?.copyWith(
                              color: AppColor.scaffoldBackgroundColor,
                              fontWeight: FontWeight.w400),
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
            padding:
                EdgeInsets.fromLTRB(size.medium, size.medium, size.medium, 0),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Shop by Car type",
                      style: theme.textTheme.titleLarge?.copyWith(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
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
                      ))
                ],
              ),
              SizedBox(height: size.medium),
              SizedBox(
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
              SizedBox(height: size.medium),
              Text(
                "Shop by Budget",
                style: theme.textTheme.titleLarge?.copyWith(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.medium),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: byBudgetCardBuilder(
                          title: "Under", subtitle: "\$20k")),
                  SizedBox(width: size.medium),
                  Expanded(
                      flex: 1,
                      child: byBudgetCardBuilder(
                          title: "From", subtitle: "\$20-40k", isActive: true)),
                  SizedBox(width: size.medium),
                  Expanded(
                      flex: 1,
                      child: byBudgetCardBuilder(
                          title: "Over", subtitle: "\$40k")),
                ],
              ),
            ],
          ))
        ],
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
      return Container(
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
