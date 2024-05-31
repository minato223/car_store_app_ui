import 'package:car_store_app_ui/core/constants/app_color.dart';
import 'package:car_store_app_ui/core/constants/app_constant.dart';
import 'package:car_store_app_ui/core/constants/app_image.dart';
import 'package:car_store_app_ui/core/constants/app_size.dart';
import 'package:car_store_app_ui/core/constants/app_svg.dart';
import 'package:car_store_app_ui/presentation/widgets/elements/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSize size = AppSize(context);
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
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
                  ))),
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
                        Text(
                          "G-corp",
                          style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondaryLightColor),
                        ),
                        SizedBox(height: size.medium),
                        SizedBox(
                          width: size.width * .7,
                          child: Text(
                            "Sint ex eu voluptate tempor quis amet ut commodo aute. Aute aute nulla commodo pariatur.",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleMedium?.copyWith(
                                height: 1.8,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )),
                Expanded(flex: 1, child: Image.asset(AppImage.presentation)),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "I'm looking to:",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleMedium?.copyWith(
                              height: 1.8,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        SizedBox(height: size.medium),
                        PrimaryButton(text: "Buy a car"),
                        SizedBox(height: size.medium),
                        Container(
                          width: size.width,
                          margin: EdgeInsets.symmetric(horizontal: size.medium),
                          padding:
                              EdgeInsets.symmetric(vertical: size.small * 1.5),
                          decoration: BoxDecoration(
                              boxShadow: AppConstant.innerShadow,
                              border: Border.all(
                                  color: AppColor.primaryColor, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            "Scale a car",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleMedium?.copyWith(
                                height: 1.8,
                                fontWeight: FontWeight.w600,
                                color: AppColor.scaffoldBackgroundColor),
                          ),
                        ),
                        SizedBox(height: size.large)
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
