// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:car_store_app_ui/core/constants/app_color.dart';
import 'package:car_store_app_ui/core/constants/app_constant.dart';
import 'package:car_store_app_ui/core/constants/app_image.dart';
import 'package:car_store_app_ui/core/constants/app_size.dart';
import 'package:car_store_app_ui/presentation/widgets/elements/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<String> menus = ["Details", "Features"];

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  String currentMenu = menus[0];
  void toggle(String menu) {
    setState(() {
      currentMenu = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSize size = AppSize(context);
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        children: [
          Container(
            height: size.height * .45,
            color: AppColor.secondaryColor,
            child: SafeArea(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(size.medium),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios_new_rounded,
                          color: AppColor.primaryColor),
                      Expanded(
                        child: Text(
                          "Audi A7 Prestige",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge?.copyWith(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Icon(Icons.ios_share_rounded,
                          color: AppColor.primaryColor),
                    ],
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(size.width * .1),
                  child: Image.asset(AppImage.detail2),
                ))
              ],
            )),
          ),
          Expanded(
              child: ListView(
            children: [
              SizedBox(
                height: size.height * .15,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: size.medium),
                    itemBuilder: (context, index) {
                      bool isActive = index == 0;
                      return Container(
                        width: size.width * .3,
                        padding: EdgeInsets.all(size.medium),
                        decoration: BoxDecoration(
                            boxShadow:
                                isActive ? AppConstant.innerShadow : null,
                            border: Border.all(
                                color: Colors.white12, width: isActive ? 2 : 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  color: AppColor.scaffoldBackgroundColor),
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
                      child: Row(
                        children: [
                          Expanded(
                            flex: currentMenu == menus[1] ? 1 : 0,
                            child: const SizedBox(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColor.scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                          Expanded(
                            flex: currentMenu == menus[0] ? 1 : 0,
                            child: const SizedBox(),
                          ),
                        ],
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
                                  style: theme.textTheme.titleSmall?.copyWith(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600,
                                      color: currentMenu == entry.value
                                          ? AppColor.primaryColor
                                          : AppColor.scaffoldBackgroundColor),
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
                                    color: AppColor.scaffoldBackgroundColor
                                        .withOpacity(.2)))),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    el.icone,
                                    color: AppColor.scaffoldBackgroundColor,
                                  ),
                                  SizedBox(width: size.small),
                                  Text(
                                    el.attribute,
                                    maxLines: 2,
                                    style: theme.textTheme.titleSmall?.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            AppColor.scaffoldBackgroundColor),
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
                                  color: AppColor.scaffoldBackgroundColor),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }).toList(),
              )
            ],
          ))
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
}
