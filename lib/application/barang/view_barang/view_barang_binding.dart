import 'package:get/get.dart';
import 'package:notes_app/application/barang/view_barang/view_barang_controller.dart';

class ViewBarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ViewBarangController());
  }
}