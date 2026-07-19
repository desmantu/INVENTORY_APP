import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/application/barang/view_barang/view_barang_controller.dart';
import 'package:notes_app/models/custom_id_name.dart';

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
    return Obx(
      () =>  Container(
        height: 100,
        padding: EdgeInsets.all(18),
        child: Row(
          children: controller.isView.value ? [
            Expanded(
              child: InkWell(
                onTap: () {
                  print("ON EDIT >> ");
                  controller.isView.value = !controller.isView.value;
                },
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
          ] : [
            Expanded(
              child: InkWell(
                 onTap: () {
                  print("ON EDIT >> ");
                  controller.isView.value = !controller.isView.value;
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueAccent, width: 1.3),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                       controller.data != null ? "Simpan Perubahan" : "Simpan",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildFormContentBarang(BuildContext context) {
    Map mapColor = controller.renderColorState(
      name: controller.data?.idNameState?.name ?? "",
    );
    return [
      SizedBox(
        height: 20,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Barang",
              style: TextStyle(
                color: const Color.fromARGB(255, 36, 36, 36),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 211, 211, 211),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextField(
                controller: controller.inpNamaBarang,
                spellCheckConfiguration:
                    const SpellCheckConfiguration.disabled(),
                decoration: InputDecoration(
                  hintStyle: TextStyle(),
                  border: InputBorder.none,
                  hint: Text(
                    "Masukan Nama barang ",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 189, 189, 189),
                      fontSize: 15,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: const Color.fromARGB(255, 62, 62, 62),
                  textBaseline: TextBaseline.alphabetic,
                  decoration: TextDecoration.none,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
          ],
        ),
      ),

      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kategori",
              style: TextStyle(
                color: const Color.fromARGB(255, 36, 36, 36),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 211, 211, 211),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Obx(
                () => DropdownButton<CustomIdName>(
                  underline: const SizedBox(),
                  isExpanded: true,
                  value: controller.selectedCategory.value,
                  items: controller.categoryItem
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name ?? ""),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    print(
                      "VALUE NYA >> $value >> dan instance >> ${value.runtimeType}",
                    );
                    controller.selectedCategory.value = value!;
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Merk",
              style: TextStyle(
                color: const Color.fromARGB(255, 36, 36, 36),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 211, 211, 211),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextField(
                controller: controller.inpMerk,
                spellCheckConfiguration:
                    const SpellCheckConfiguration.disabled(),
                decoration: InputDecoration(
                  hintStyle: TextStyle(),
                  border: InputBorder.none,
                  hint: Text(
                    "Masukan Merk ",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 189, 189, 189),
                      fontSize: 15,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: const Color.fromARGB(255, 62, 62, 62),
                  textBaseline: TextBaseline.alphabetic,
                  decoration: TextDecoration.none,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
          ],
        ),
      ),

      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tipe",
              style: TextStyle(
                color: const Color.fromARGB(255, 36, 36, 36),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 211, 211, 211),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextField(
                controller: controller.inpTipe,
                spellCheckConfiguration:
                    const SpellCheckConfiguration.disabled(),
                decoration: InputDecoration(
                  hintStyle: TextStyle(),
                  border: InputBorder.none,
                  hint: Text(
                    "Masukan Tipe ",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 189, 189, 189),
                      fontSize: 15,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: const Color.fromARGB(255, 62, 62, 62),
                  textBaseline: TextBaseline.alphabetic,
                  decoration: TextDecoration.none,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
          ],
        ),
      ),

      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Serial Number",
              style: TextStyle(
                color: const Color.fromARGB(255, 36, 36, 36),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 211, 211, 211),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextField(
                controller: controller.inpSerialNumber,
                spellCheckConfiguration:
                    const SpellCheckConfiguration.disabled(),
                decoration: InputDecoration(
                  hintStyle: TextStyle(),
                  border: InputBorder.none,
                  hint: Text(
                    "Masukan Serial Number ",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 189, 189, 189),
                      fontSize: 15,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: const Color.fromARGB(255, 62, 62, 62),
                  textBaseline: TextBaseline.alphabetic,
                  decoration: TextDecoration.none,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
          ],
        ),
      ),

      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Text(
                "Tanggal Pembelian",
                style: TextStyle(
                  color: const Color.fromARGB(255, 36, 36, 36),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Obx(
              () => Container(
                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 211, 211, 211),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      style: TextStyle(fontSize: 16),
                      controller.tanggalPembelian.value != null
                          ? DateFormat(
                              'dd MMMM yyyy',
                              'id_ID',
                            ).format(controller.tanggalPembelian.value!)
                          : "Tanggal Pembelian",
                    ),
                    InkWell(
                      onTap: () => controller.pilihTanggal(context),
                      child: Icon(Icons.calendar_month_outlined),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Harga",
              style: TextStyle(
                color: const Color.fromARGB(255, 36, 36, 36),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 211, 211, 211),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: false,
                ),
                controller: controller.inpHarga,
                inputFormatters: [
                  CurrencyTextInputFormatter.currency(
                    locale: 'id',
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ),
                ],
                spellCheckConfiguration:
                    const SpellCheckConfiguration.disabled(),
                decoration: InputDecoration(
                  hintStyle: TextStyle(),
                  border: InputBorder.none,
                  hint: Text(
                    "Masukan harga ",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 189, 189, 189),
                      fontSize: 15,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: const Color.fromARGB(255, 62, 62, 62),
                  textBaseline: TextBaseline.alphabetic,
                  decoration: TextDecoration.none,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
          ],
        ),
      ),

      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Keterangan",
              style: TextStyle(
                color: const Color.fromARGB(255, 36, 36, 36),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 211, 211, 211),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextField(
                minLines: null,
                maxLines: null,
                expands: true,
                controller: controller.inpKeterangan,
                spellCheckConfiguration:
                    const SpellCheckConfiguration.disabled(),
                decoration: InputDecoration(
                  hintStyle: TextStyle(),
                  border: InputBorder.none,
                  hint: Text(
                    "Masukan Keterangan ",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 189, 189, 189),
                      fontSize: 15,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: const Color.fromARGB(255, 62, 62, 62),
                  textBaseline: TextBaseline.alphabetic,
                  decoration: TextDecoration.none,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
          ],
        ),
      ),

    ];
  }

  List<Widget> buildViewContentBarang() {
    Map mapColor = controller.renderColorState(
      name: controller.data?.idNameState?.name ?? "",
    );
    return [
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
              controller.data?.nameTrBarang ?? "",
              style: TextStyle(fontSize: 18),
            ),
            Container(
              decoration: BoxDecoration(),
              width: Get.width,
              child: Row(
                children: [
                  Container(
                    child: Text(
                      controller.data?.number ?? "",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(width: 20),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: mapColor["color"],
                    ),
                    child: Text(
                      controller.data?.idNameState?.name ?? "",
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
              value: controller.data?.idNameCategory?.name ?? "",
            ),
            buildRowField(field: "Merk", value: controller.data?.merk ?? ""),
            buildRowField(field: "Tipe", value: controller.data?.tipe ?? ""),
            buildRowField(
              field: "Serial Number",
              value: controller.data?.serialNumber ?? "",
            ),
            buildRowField(
              field: "Tanggal Pembelian",
              value:
                  DateFormat(
                    'dd MMMM yyyy',
                    'id_ID',
                  ).format(controller.data!.tanggalPembelian!) ??
                  "",
            ),
            buildRowField(
              field: "Harga",
              value:
                  NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp ',
                  ).format(controller.data?.harga) ??
                  "",
            ),
            buildRowField(
              field: "Keterangan",
              value: controller.data?.keterangan ?? "",
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Barang")),
      backgroundColor: Colors.white,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () =>  ListView(
                  children: controller.isView.value
                      ? buildViewContentBarang()
                      : buildFormContentBarang(context),
                ),
              ),
            ),
            buildActionButton(),
          ],
        ),
      ),
    );
  }
}
