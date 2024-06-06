import 'package:car_store_app_ui/core/theme/theme_provider.dart';
import 'package:car_store_app_ui/presentation/controllers/common/store_binding.dart';
import 'package:car_store_app_ui/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Taama Seben',
      debugShowCheckedModeBanner: false,
      theme: ThemeProvider.ligth,
      darkTheme: ThemeProvider.dark,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      getPages: Routes.getPages,
      initialRoute: Routes.welcomePage,
      initialBinding: StoreBinding(),
    );
  }
}
