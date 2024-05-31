// ignore_for_file: must_be_immutable

import 'package:car_store_app_ui/core/constants/app_color.dart';
import 'package:car_store_app_ui/core/constants/app_size.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  String text;
  Function()? ontap;
  SecondaryButton({super.key, required this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSize size = AppSize(context);
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: size.width,
        margin: EdgeInsets.symmetric(horizontal: size.medium),
        padding: EdgeInsets.symmetric(vertical: size.small),
        decoration: BoxDecoration(
            color: AppColor.secondaryLightColor,
            boxShadow: const [
              BoxShadow(
                  color: AppColor.secondaryColor,
                  offset: Offset(3, 5),
                  spreadRadius: 1,
                  blurRadius: 0)
            ],
            border: Border.all(color: AppColor.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(
              height: 1.8,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
