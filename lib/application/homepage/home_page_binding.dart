import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';
import 'package:notes_app/application/homepage/home_page_controller.dart';

class HomePageBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(HomePageController());
  }
  
}