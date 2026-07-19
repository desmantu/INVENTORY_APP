import 'package:get/get.dart';
import 'package:notes_app/application/barang/detail_barang/show_detail_barang_controller.dart';

class ShowDetailBarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ShowDetailBarangController());
  }

}