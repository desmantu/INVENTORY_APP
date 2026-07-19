import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/barang_model.dart';

class ViewBarangController extends GetxController {
  final BarangModel data = Get.arguments["data"];
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
}