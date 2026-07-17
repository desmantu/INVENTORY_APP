import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/barang_model.dart';
import 'package:notes_app/services/master_service.dart';


class ShowBarangPageController extends GetxController {

  final title = Get.arguments["title"];
  final idCategory = Get.arguments["id_category"];
  final iconColor = Get.arguments["color"] ?? Colors.grey.shade100;
  // final title =  Get.arguments;
  final t = "".obs;
  final inpSearchBarang = TextEditingController().obs;
  final listBarang = <BarangModel>[].obs;
  

  @override
  void onInit() {
    super.onInit();
    getShowListBarang();
  }

Map renderColorState({
  required String name
}){
  Map mapColor = Map();
  Color color = Colors.grey;
  Color fontColor = Colors.black;
  if(name == "Tersedia"){
    color = const Color.fromARGB(255, 185, 238, 187);
    fontColor = const Color.fromARGB(255, 51, 179, 56);
  }else if(name == "Dipinjam"){
    color = const Color.fromARGB(255, 241, 231, 181);
    fontColor = const Color.fromARGB(255, 197, 170, 15);
  }else if(name == "Rusak"){
    color = const Color.fromARGB(255, 255, 196, 179);
    fontColor = const Color.fromARGB(255, 222, 65, 65);
  } 


  mapColor["color"] = color;
  mapColor["font-color"] = fontColor;

  return mapColor;
}

void getShowListBarang() async {
    final result = await masterService.getShowListBarang(
      idCategory: idCategory
    );
    result.fold(
      (l) {
        Get.snackbar("Erorr", l);
      },
      (r) {
        listBarang.value = r;
        print("DESMANTU CEKK LIST ");
        print(listBarang.map((element) => element.toJson(),).toList());
      },
    );


  }

}