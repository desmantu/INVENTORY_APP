import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:notes_app/application/main/app_main_controller.dart';

class CustomBottomBar extends StatelessWidget {
  final AppMainController parent;
  const CustomBottomBar({super.key, required this.parent});

  Widget iconMenu(int index, IconData icon) {
    return InkWell(
      onTap: () {
        
        parent.setSelectedIndex(index);        
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Icon(
          fontWeight: FontWeight.bold,
          size: parent.selectedPage.value == index ? 32 : 30,
          color: parent.selectedPage.value == index ? Colors.lightBlue :  Colors.grey,
          icon
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>  Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconMenu(1, Icons.home),
            iconMenu(2, Icons.chat),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(color: Colors.white, Icons.add),
            ),
            iconMenu(3, Icons.calendar_month_rounded),
            iconMenu(4, Icons.verified_user),
      
      
          ],
        ),
      ),
    );
  }
}
