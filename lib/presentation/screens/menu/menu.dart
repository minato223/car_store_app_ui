import 'package:car_store_app_ui/core/constants/app_color.dart';
import 'package:car_store_app_ui/core/constants/app_constant.dart';
import 'package:car_store_app_ui/core/constants/app_size.dart';
import 'package:car_store_app_ui/presentation/screens/models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  MenuItem currentMenuItem = AppConstant.menuItems[0];

  void updateMenuItem(MenuItem menuItem) {
    setState(() {
      currentMenuItem = menuItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSize size = AppSize(context);
    return Scaffold(
      body: currentMenuItem.component,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.all(size.small),
        decoration: BoxDecoration(
          color: AppColor.scaffoldBackgroundColor,
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
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1000),
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: AppConstant.menuItems.asMap().entries.map((el) {
                  bool isActive = el.value == currentMenuItem;
                  return GestureDetector(
                    onTap: () {
                      updateMenuItem(el.value);
                    },
                    child: Container(
                        padding: EdgeInsets.all(size.medium),
                        margin: EdgeInsets.only(
                            right: el.key == AppConstant.menuIcons.length - 1
                                ? 0
                                : 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.primaryColor
                                    .withOpacity(isActive ? 1 : .2),
                                width: 2),
                            color: isActive ? AppColor.secondaryColor : null,
                            shape: BoxShape.circle),
                        child: SvgPicture.asset(el.value.icon)),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
