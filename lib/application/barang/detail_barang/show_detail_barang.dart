import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/application/barang/detail_barang/show_detail_barang_controller.dart';


class ShowDetailBarang extends GetView<ShowDetailBarangController> {
  const ShowDetailBarang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AAA"),
      ),
    );
  }
}