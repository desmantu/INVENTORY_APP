import 'package:get/get.dart';
import 'package:notes_app/application/barang/show_barang/show_barang_page_controller.dart';


class ShowBarangPageBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.put(ShowBarangPageController());
  }
}