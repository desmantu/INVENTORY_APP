import 'package:get/get.dart';
import 'package:notes_app/application/category/category_page_controller.dart';

class CategoryPageBinding extends Bindings {
  
@override
  void dependencies() {
    Get.put(CategoryPageController());
  }
  
}
