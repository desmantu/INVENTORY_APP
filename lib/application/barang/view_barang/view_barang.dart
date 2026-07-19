import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/application/barang/view_barang/view_barang_controller.dart';

class ViewBarang extends GetView<ViewBarangController> {
  const ViewBarang({Key? key}) : super(key: key);

  Widget buildRowField({required String field, required String value}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.black.withOpacity(0.1),
            width: 0.5,
          ),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              child: Text(
                textAlign: TextAlign.start,
                field,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              child: Text(
                value,
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildActionButton() {
    return Container(
      height: 100,
      padding: EdgeInsets.all(18),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blueAccent, width: 1.3),
                color: Colors.transparent,
              ),
              child: Center(
                child: Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.redAccent, width: 1.3),
                color: Colors.transparent,
              ),
              child: Center(
                child: Text(
                  "Hapus",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map mapColor = controller.renderColorState(
      name: controller.data.idNameState?.name ?? "",
    );
    return Scaffold(
      appBar: AppBar(title: Text("Detail Barang")),
      backgroundColor: Colors.white,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Icon(size: 150, Icons.monitor),
            ),

            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.data.nameTrBarang ?? "",
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    width: Get.width,
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            controller.data.number ?? "",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SizedBox(width: 20),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: mapColor["color"],
                          ),
                          child: Text(
                            controller.data.idNameState?.name ?? "",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: mapColor["font-color"],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  buildRowField(
                    field: "Kategori",
                    value: controller.data.idNameCategory?.name ?? "",
                  ),
                  buildRowField(
                    field: "Merk",
                    value: controller.data.merk ?? "",
                  ),
                  buildRowField(
                    field: "Tipe",
                    value: controller.data.tipe ?? "",
                  ),
                  buildRowField(
                    field: "Serial Number",
                    value: controller.data.serialNumber ?? "",
                  ),
                  buildRowField(
                    field: "Tanggal Pembelian",
                    value:
                        DateFormat(
                          'dd MMMM yyyy',
                        ).format(controller.data.tanggalPembelian!) ??
                        "",
                  ),
                  buildRowField(
                    field: "Harga",
                    value:
                        NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: 'Rp ',
                        ).format(controller.data.harga) ??
                        "",
                  ),
                  buildRowField(
                    field: "Keterangan",
                    value: controller.data.keterangan ?? "",
                  ),
                ],
              ),
            ),

            buildActionButton()
          ],
        ),
      ),
    );
  }
}
