import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/landing_controller.dart';
import '../widgets/landing_widgets.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: GetBuilder<LandingController>(
        builder: (c) {
          return c.pagesLanding.elementAt(c.selectedIndex.value);
        },
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
