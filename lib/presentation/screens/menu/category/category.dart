import 'package:car_store_app_ui/core/constants/app_color.dart';
import 'package:car_store_app_ui/core/constants/app_constant.dart';
import 'package:car_store_app_ui/core/constants/app_size.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSize size = AppSize(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColor.primaryColor,
            width: size.width,
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(size.medium),
                  child: Text(
                    "Categories",
                    style: theme.textTheme.titleLarge?.copyWith(
                        color: AppColor.scaffoldBackgroundColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height * .05,
                  child: ListView.separated(
                      padding: EdgeInsets.only(left: size.medium),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        bool isActive = index == 0;
                        return Stack(
                          children: [
                            Center(
                              child: Text(
                                AppConstant.titleCategories[index],
                                style: theme.textTheme.titleSmall?.copyWith(
                                    color: isActive
                                        ? AppColor.secondaryColor
                                        : AppColor.scaffoldBackgroundColor,
                                    fontWeight: isActive
                                        ? FontWeight.w600
                                        : FontWeight.w400),
                              ),
                            ),
                            if (isActive)
                              Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: -2,
                                  height: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ))
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: size.large,
                        );
                      },
                      itemCount: AppConstant.titleCategories.length),
                )
              ],
            )),
          ),
          Expanded(
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          Container(
                            color: AppColor.secondaryColor,
                            padding:
                                EdgeInsets.symmetric(vertical: size.medium),
                            child: Column(
                              children: [
                                Text(
                                  "Sping Sales",
                                  style: theme.textTheme.titleLarge?.copyWith(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: size.small),
                                Text(
                                  "Save up to \$20 sale snakers",
                                  style: theme.textTheme.titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.medium),
                          Column(
                            children: AppConstant.vehicles
                                .asMap()
                                .entries
                                .map((entry) {
                              bool isActive = entry.key == 0;
                              return Container(
                                clipBehavior: Clip.hardEdge,
                                width: size.width,
                                margin: EdgeInsets.fromLTRB(
                                    size.medium, 0, size.medium, size.medium),
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
                                        color: AppColor.primaryColor
                                            .withOpacity(isActive ? 1 : .2),
                                        width: isActive ? 2 : 1)),
                                child: Stack(
                                  children: [
                                    Transform(
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 001)
                                        ..translate(size.width * .3),
                                      child: Image.asset(
                                        entry.value.image,
                                        width: size.width * .7,
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      bottom: 0,
                                      width: size.width * .7,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: size.large,
                                            horizontal: size.medium),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  entry.value.name,
                                                  style: theme
                                                      .textTheme.titleLarge
                                                      ?.copyWith(
                                                          color: AppColor
                                                              .primaryColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                SizedBox(height: size.small),
                                                Text(
                                                  "Free 7 day return",
                                                  style: theme
                                                      .textTheme.titleMedium
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .textGrayColor),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: size.small,
                                                  horizontal: size.medium),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color:
                                                          AppColor.primaryColor,
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
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColor
                                                                .primaryColor),
                                                  ),
                                                  SizedBox(
                                                      width: size.small * .5),
                                                  const Icon(
                                                    Icons.arrow_forward_rounded,
                                                    color:
                                                        AppColor.primaryColor,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: size.height * .15,
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: size.height * .17,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: const [
                                .1,
                                .7,
                                1
                              ],
                                  colors: [
                                AppColor.scaffoldBackgroundColor,
                                AppColor.scaffoldBackgroundColor
                                    .withOpacity(.9),
                                AppColor.scaffoldBackgroundColor
                                    .withOpacity(.01)
                              ])),
                        ),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
