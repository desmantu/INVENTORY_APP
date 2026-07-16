import 'package:get/instance_manager.dart';
import 'package:notes_app/application/homepage/home_page_controller.dart';
import 'package:notes_app/application/main/app_main_controller.dart';

class AppMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppMainController>(AppMainController());
        Get.put<HomePageController>(HomePageController());
    
  }
}