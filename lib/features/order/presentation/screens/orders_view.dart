import 'package:cashback/features/order/presentation/widgets/orders_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/order_controller.dart';
class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

final OrdersController controller = Get.find();
class _OrdersViewState extends State<OrdersView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBar(),
      body: bodyWidgets(),
    );
  }
}
