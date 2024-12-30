import 'package:cashback/features/category/controllers/category_controller.dart';
import 'package:get/get.dart';

class CategoryBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> CategoryController());
  }

}