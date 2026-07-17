import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/count_dashboard_barang_model.dart';
import 'package:notes_app/models/dashboard_category_barang_model.dart';
import 'package:notes_app/services/master_service.dart';

class HomePageController extends GetxController {
  final isLoading = true.obs;
  CountDashboardBarangModel dashboardBarangModel = CountDashboardBarangModel();
  List<DashboardCategoryBarangModel> listDashboardCategory =
      <DashboardCategoryBarangModel>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    getDashboardItem();
    getDashboardCategory();
  }

  Color buildCategoryColor(String category) {
    switch (category) {
      case "Elektronik":
        return  Colors.blue;
      case "Furniture":
        return  Colors.green;
      case "ATK":
        return Colors.amber;
      default:
      return Colors.grey;
    }
  }

  Icon buildCategoryIcon(String category) {
    switch (category) {
      case "Elektronik":
        return Icon(Icons.monitor, color: Colors.blue, size: 50);
      case "Furniture":
        return Icon(Icons.chair, color: Colors.green, size: 50);
      case "ATK":
        return Icon(Icons.person_pin_circle_sharp, color: Colors.amber, size: 50);
      default:
      return Icon(Icons.more_horiz_rounded, color: Colors.grey,size: 50);
    }
  }

  void getDashboardItem() async {
    isLoading.value = true;
    final result = await masterService.getCountDashboardBarang();
    result.fold(
      (l) {
        Get.snackbar("Erorr", l);
      },
      (r) {
        dashboardBarangModel = r;
        isLoading.value = false;
      },
    );


  }

  void getDashboardCategory() async {
    isLoading.value = true;
    final result = await masterService.getDashboardCategory();
    result.fold(
      (l) {
        Get.snackbar("Erorr", l);
      },
      (r) {
        listDashboardCategory = r;
        isLoading.value = false;

      },
    );

  }
}
