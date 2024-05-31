import 'package:car_store_app_ui/core/constants/app_color.dart';
import 'package:car_store_app_ui/core/constants/app_image.dart';
import 'package:car_store_app_ui/core/constants/app_svg.dart';
import 'package:car_store_app_ui/presentation/screens/models/vehicle.dart';
import 'package:car_store_app_ui/presentation/screens/models/vehicle_option_item.dart';
import 'package:car_store_app_ui/presentation/screens/models/vehicle_tab_item.dart';
import 'package:flutter/material.dart';

class AppConstant {
  static List<String> vehicleBrands = [
    'Toyota',
    'Ford',
    'Honda',
    'Chevrolet',
    'Volkswagen',
    'BMW',
    'Mercedes-Benz',
    'Audi',
    'Nissan',
    'Hyundai'
  ];

  static List<String> menuIcons = [
    AppSvg.home,
    AppSvg.heart,
    AppSvg.bookmark,
    AppSvg.user,
  ];

  static List<String> titleCategories = [
    'New',
    'Latest',
    'Squad',
    'Popular',
    'Trending',
    'Top',
    'Must See',
    'Featured',
    'Classic',
    'Essential'
  ];

  static List<Vehicle> vehicles = [
    //Vehicle(image: AppImage.car1, name: "Audi A7 Prestige"),
    Vehicle(image: AppImage.car2, name: "Audi A7 Prestige"),
    Vehicle(image: AppImage.car3, name: "Audi A7 Prestige"),
    Vehicle(image: AppImage.car4, name: "Audi A7 Prestige"),
    Vehicle(image: AppImage.car5, name: "Audi A7 Prestige"),
    Vehicle(image: AppImage.car6, name: "Audi A7 Prestige"),
    Vehicle(image: AppImage.car7, name: "Audi A7 Prestige")
  ];

  static List<VehicleTabItem> tabItems = [
    VehicleTabItem(icone: AppSvg.calendar, name: "Free 7 day return"),
    VehicleTabItem(icone: AppSvg.certificate, name: "30 day warranty"),
    VehicleTabItem(icone: AppSvg.dollar, name: "Hassle free financing"),
    VehicleTabItem(icone: AppSvg.calendar, name: "1.28 (5 ft inches)"),
  ];

  static List<BoxShadow> innerShadow = const [
    BoxShadow(color: Colors.white24),
    BoxShadow(
      color: AppColor.primaryColor,
      spreadRadius: -6,
      blurRadius: 6.0,
    ),
  ];

  static List<VehicleOptionItem> vehicleOptionItems = [
    VehicleOptionItem(
        attribute: "Transmission", icone: AppSvg.dashboard, value: "Automatic"),
    VehicleOptionItem(
        attribute: "Engine", icone: AppSvg.engine, value: "6 cylinders"),
    VehicleOptionItem(
        attribute: "Mileage", icone: AppSvg.dashboard, value: "17,622"),
  ];
}
