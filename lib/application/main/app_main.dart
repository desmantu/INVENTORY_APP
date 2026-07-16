import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/application/category/category_page.dart';
import 'package:notes_app/application/homepage/home_page.dart';
import 'package:notes_app/application/main/app_main_controller.dart';
import 'package:notes_app/custom/custom_bottom_bar.dart';

class AppMain extends GetView<AppMainController> {
  const AppMain({Key? key}) : super(key: key);

  Widget buildNavigationItem({
    required int index,
    required String name,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () {
        controller.setSelectedIndex(index);
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: controller.selectedPage.value == index
                  ? Colors.blue
                  : const Color.fromARGB(255, 42, 42, 42),
              size: 35,
            ),
            SizedBox(height: 5),
            Text(
              name,
              style: TextStyle(
                color: controller.selectedPage.value == index
                    ? Colors.blue
                    : const Color.fromARGB(255, 42, 42, 42),
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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(size: 20, Icons.menu),
            Text(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              "Dashboard",
            ),
            Container(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(color: Colors.amber),
        height: Get.height,
        width: Get.width,
        child: Obx(
          () =>  Stack(
            children: [
              PageView(
                controller: controller.pageController,
                onPageChanged: (value) {
                  controller.setSelectedIndex(value);
                },
                children: [
                  HomePage(),
                  CategoryPage()
          
                  ],
              ),
          
              Align(
                  alignment: AlignmentGeometry.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildNavigationItem(
                          index: 0,
                          name: "Dashboard",
                          icon: Icons.home_filled,
                        ),
                
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(55),
                            ),
                            height: 75,
                            width: 75,
                            child: Icon(Icons.add, size: 35, color: Colors.white),
                          ),
                        ),
                
                         buildNavigationItem(
                          index: 1,
                          name: "Kategori",
                          icon: Icons.category_rounded,
                        ),
                
                      ],
                    ),
                  ),
                ),
              
          
              // Align(
              //   alignment: AlignmentGeometry.bottomCenter,
              //   child: CustomBottomBar(
              //     parent: controller,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
