import 'package:cashback/features/store/presentation/widgets/stores_online_widgets.dart';
import 'package:flutter/material.dart';
class StoresOnlineView extends StatefulWidget {
  const StoresOnlineView({super.key});

  @override
  State<StoresOnlineView> createState() => _StoresOnlineViewState();
}

class _StoresOnlineViewState extends State<StoresOnlineView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: bodyWidgets(),
    );
  }
}

