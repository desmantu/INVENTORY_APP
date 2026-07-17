import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/application/barang/show_barang/show_barang_page_controller.dart';
import 'package:notes_app/models/barang_model.dart';

class ShowBarangPage extends GetView<ShowBarangPageController> {
  const ShowBarangPage({Key? key}) : super(key: key);
  

  Widget buildCardBarang({
    required BarangModel model,
    required Color color
    }) {
    Map mapColor = controller.renderColorState(name: model.idNameState?.name ?? "");
    return Container(
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
                Container(
                  child: Icon(Icons.monitor, size: 55, color: color),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.nameTrBarang ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color.fromARGB(255, 39, 39, 39),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(model.number ?? "", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),

          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: mapColor["color"],
                ),
                child: Text(
                  model.idNameState?.name ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: mapColor["font-color"],
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                child: Icon(
                  size: 20,
                  Icons.arrow_forward_ios_rounded,
                  color: const Color.fromARGB(255, 43, 43, 43),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              controller.title ?? "",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Icon(Icons.more_vert),
          ],
        ),
      ),
      body: Obx(
        () =>  Container(
          padding: EdgeInsets.all(20),
          height: Get.height,
          width: Get.width,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 247, 247, 247),
                ),
                width: Get.width,
                height: Get.height / 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(child: InkWell(
                      onTap: () {
                        controller.getShowListBarang();
                      },
                      child: Icon(Icons.search))),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: TextField(
                          style: TextStyle(),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Cari barang...",
                          ),
                          onSubmitted: (value) {
                            controller.getShowListBarang();
                          },
                          controller: controller.inpSearchBarang.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(
                height: 20,
              ),
        
              if(controller.listBarang.isNotEmpty)
              ...List.generate(controller.listBarang.length,(index) {
                final BarangModel model = controller.listBarang[index];
                return buildCardBarang(model: model, color: controller.iconColor);
              },)
        
              // buildCardBarang(),
            ],
          ),
        ),
      ),
    );
  }
}
