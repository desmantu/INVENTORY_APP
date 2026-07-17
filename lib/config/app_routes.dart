import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';
import 'package:notes_app/application/barang/show_barang/show_barang_page.dart';
import 'package:notes_app/application/barang/show_barang/show_barang_page_binding.dart';
import 'package:notes_app/application/main/app_main.dart';
import 'package:notes_app/application/main/app_main_binding.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteName.appMain,
      page: () => AppMain(),
      binding: AppMainBinding(),
      curve: Curves.easeInOut,
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    GetPage(
      name: RouteName.showBarangPage,
      page: () => ShowBarangPage(),
      binding: ShowBarangPageBinding(),
      curve: Curves.easeInOut,
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
  
}


class RouteName {
  static final appMain = "/main_page";
  static final showBarangPage = "/show_list_barang";
}