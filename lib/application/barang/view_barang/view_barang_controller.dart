import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/barang_model.dart';
import 'package:notes_app/models/custom_id_name.dart';
import 'package:notes_app/services/master_service.dart';

class ViewBarangController extends GetxController {
  final RxBool isView = Get.arguments["IS_VIEW"] ?? true.obs;
  final BarangModel? data = Get.arguments["data"];

  // DATA FORM DES
  final TextEditingController inpNamaBarang = TextEditingController();
  final Rxn<CustomIdName> selectedCategory = Rxn<CustomIdName>();
  final TextEditingController inpMerk = TextEditingController();
  final TextEditingController inpTipe = TextEditingController();
  final TextEditingController inpSerialNumber = TextEditingController();
  final Rxn<DateTime> tanggalPembelian = Rxn<DateTime>();
  final TextEditingController inpHarga = TextEditingController();
  final TextEditingController inpKeterangan = TextEditingController();

  final categoryItem = <CustomIdName>[].obs;

  @override
  void onInit() {
    super.onInit();
    prepareDataBarang();
    getCategoryItem();
  }

  void prepareDataBarang() {
    print("MASUK MASUK PREPARE DATA BARANG >> VIEW > $isView");
    if (data != null) {
      inpNamaBarang.text = data!.nameTrBarang ?? "";
      if (data!.idNameCategory?.id != null) {
        selectedCategory.value = data!.idNameCategory!;
      }
      inpMerk.text = data!.merk ?? "";
      inpTipe.text = data!.tipe ?? "";
      inpSerialNumber.text = data!.serialNumber ?? "";
      if (data!.tanggalPembelian != null) {
        tanggalPembelian.value = data!.tanggalPembelian!;
      }
      if (data!.harga != null) {
        inpHarga.text = data!.harga.toString();
      }
      inpKeterangan.text = data!.keterangan ?? "";

      categoryItem.add(CustomIdName(name: "None"));
      categoryItem.add(CustomIdName(name: "DATA", id: "1"));

    }
    update();
  }

  Future<void> pilihTanggal(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: tanggalPembelian.value ?? DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (picked != null) {
    tanggalPembelian.value = picked;
  }
  update();
}

  getCategoryItem() async {
    print("MASUKK");
    try {
      final result = await masterService.getCategory();
      result.fold(
        (l) {
          Get.snackbar("Terjadi Kendala", l);
        },
        (r) {
          categoryItem.addAll(r);
          selectedCategory.value = categoryItem.firstWhereOrNull((element) => element.id == data?.idNameCategory!.id) ?? null;
        },
      );
    } catch (e) {
      e.printError();
    }
  }

  Map renderColorState({required String name}) {
    Map mapColor = Map();
    Color color = Colors.grey;
    Color fontColor = Colors.black;
    if (name == "Tersedia") {
      color = const Color.fromARGB(255, 185, 238, 187);
      fontColor = const Color.fromARGB(255, 51, 179, 56);
    } else if (name == "Dipinjam") {
      color = const Color.fromARGB(255, 241, 231, 181);
      fontColor = const Color.fromARGB(255, 197, 170, 15);
    } else if (name == "Rusak") {
      color = const Color.fromARGB(255, 255, 196, 179);
      fontColor = const Color.fromARGB(255, 222, 65, 65);
    }

    mapColor["color"] = color;
    mapColor["font-color"] = fontColor;

    return mapColor;
  }
}
