import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AppMainController extends GetxController {

  final pageController = PageController();
  final selectedPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setSelectedIndex(int index){
    selectedPage.value = index;
    pageController.animateToPage(index, duration:Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
  
}