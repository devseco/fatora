import 'package:cashback/features/order/controllers/order_controller.dart';
import 'package:get/get.dart';

class OrdersBindings implements Bindings {
  @override
  void dependencies() {
   Get.lazyPut(()=> OrdersController() , fenix: true);
  }
}