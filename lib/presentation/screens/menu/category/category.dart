import 'package:car_store_app_ui/core/constants/app_color.dart';
import 'package:car_store_app_ui/core/constants/app_constant.dart';
import 'package:car_store_app_ui/core/constants/app_size.dart';
import 'package:car_store_app_ui/presentation/screens/menu/category/widgets/car_card.dart';
import 'package:car_store_app_ui/presentation/screens/models/vehicle.dart';
import 'package:car_store_app_ui/presentation/widgets/completes/app_animated_list_view.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Vehicle? selectedVehicle;
  void updateSelectedVehicle(Vehicle vehicle) {
    setState(() {
      selectedVehicle = vehicle;
    });
  }

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
                      AppAnimatedListView(
                        animationStart: AppAnimationStart.bottom,
                        contentPadding: EdgeInsets.zero,
                        widgets: [
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
                          ...AppConstant.vehicles.asMap().entries.map((entry) {
                            bool isActive = entry.value == selectedVehicle;
                            return CarCard(
                              vehicle: entry.value,
                              isActive: isActive,
                              onTapCallback: (vehicle) {
                                updateSelectedVehicle(vehicle);
                              },
                            );
                          }),
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
