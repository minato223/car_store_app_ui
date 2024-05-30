import 'package:car_store_app_ui/presentation/screens/menu/menu.dart';
import 'package:car_store_app_ui/presentation/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static const String welcomePage = "/welcome";
  static const String menuPage = "/menu";
  static List<GetPage<dynamic>>? getPages = [
    getPage(menuPage, const Menu()),
    getPage(welcomePage, const Welcome()),
  ];

  static GetPage getPage(String name, Widget page, {List<Bindings>? bindings}) {
    return GetPage(name: name, page: () => page, bindings: bindings ?? []);
  }
}
