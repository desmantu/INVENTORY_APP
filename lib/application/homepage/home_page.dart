import 'dart:ffi';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/application/homepage/home_page_controller.dart';
import 'package:notes_app/config/app_routes.dart';
import 'package:notes_app/custom/custom_loading.dart';
import 'package:notes_app/custom/shimmer_loading.dart';
import 'package:notes_app/models/dashboard_category_barang_model.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  Widget buildTitle({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Text(
        title,
        style: TextStyle(
          color: const Color.fromARGB(255, 35, 35, 35),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildCard({
    required String title,
    required int count,
    required Color primaryColor,
    required Color backgroundColor,
    required IconData icon,
    bool? isLoading,
  }) {
    return Expanded(
      child: AnimatedCrossFade(
        crossFadeState: controller.isLoading.value
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: Duration(milliseconds: 200),
        sizeCurve: Curves.linear,
        firstChild: Container(
          width: Get.width,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerLoading(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade100,
                  ),
                  width: 50,
                  height: 50,
                ),
              ),

              SizedBox(height: 20),

              ShimmerLoading(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.grey.shade100,
                  ),
                  height: 20,
                  width: 120,
                ),
              ),

              const SizedBox(height: 20),

              ShimmerLoading(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.grey.shade100,
                  ),
                  height: 20,
                  width: 70,
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
        secondChild: Container(
          width: Get.width,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(size: 50, icon, color: primaryColor),

              SizedBox(height: 20),

              Text(
                title,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                count.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardCategory({
    required DashboardCategoryBarangModel model,
    required String category,
    required String total,
    required Icon icon,
    required Color color,
  }) {
    return InkWell(
      onTap: () {
        print("ON TAP >> $category");
        Get.toNamed(RouteName.showBarangPage, arguments: {
          "id_category" : model.idCategory,
          "title" : category,
          "color" : color
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black12.withAlpha(1), offset: Offset(1, 2)),
          ],
          border: BoxBorder.symmetric(
            horizontal: BorderSide(
              width: 0.5,
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white10,
        ),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(child: icon),
                  SizedBox(width: 20),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: const Color.fromARGB(255, 39, 39, 39),
                        ),
                      ),
                      Text(total, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: const Color.fromARGB(255, 43, 43, 43),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          padding: EdgeInsets.all(20),
          width: Get.width,
          height: Get.height,
          child: ListView(
            children: [
              // SizedBox(height: 20),
              InkWell(
                onTap: () {
                  controller.isLoading.value =
                      !controller.isLoading.value ?? false;
                },
                child: buildTitle(title: "Ringkasan Inventaris"),
              ),
              Row(
                children: [
                  buildCard(
                    icon: Icons.book,
                    title: "Total Barang",
                    count: controller.dashboardBarangModel.totalBarang ?? 0,
                    primaryColor: Colors.blue,
                    backgroundColor: Colors.blue[50] ?? Colors.blue,
                  ),
                  SizedBox(width: 20),
                  buildCard(
                    icon: Icons.check_circle_outline_sharp,
                    title: "Tersedia",
                    count: controller.dashboardBarangModel.totalTersedia ?? 0,
                    primaryColor: Colors.green,
                    backgroundColor: Colors.green[50] ?? Colors.green,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  buildCard(
                    icon: Icons.punch_clock,
                    title: "Di Pinjam",
                    count: controller.dashboardBarangModel.totalPinjam ?? 0,
                    primaryColor: Colors.orange,
                    backgroundColor: Colors.orange[50] ?? Colors.orange,
                  ),
                  SizedBox(width: 20),
                  buildCard(
                    icon: Icons.warning,
                    title: "Rusak",
                    count: controller.dashboardBarangModel.totalRusak ?? 0,
                    primaryColor: Colors.red,
                    backgroundColor: Colors.red[50] ?? Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              buildTitle(title: "Kategori"),
              if (controller.isLoading.value)
                ...List.generate(5, (index) {
                  return customLoading.cardLoading();
                }),

              if(controller.listDashboardCategory.isNotEmpty)
              ...List.generate(controller.listDashboardCategory.length ?? 0, (
                index,
              ) {
                DashboardCategoryBarangModel model =
                    controller.listDashboardCategory[index];
                return buildCardCategory(
                  model: model,
                  category: model.nameCategory ?? "",
                  total: "${model.totalBarang ?? 0} Barang ",
                  icon: controller.buildCategoryIcon(model.nameCategory ?? ""),
                  color: controller.buildCategoryColor(model.nameCategory ?? ""),
                );
              }),
              SizedBox(height: 100),

              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
