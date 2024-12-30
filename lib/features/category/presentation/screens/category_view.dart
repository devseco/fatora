import 'package:flutter/material.dart';
import '../widgets/category_widgets.dart';
class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: bodyWidgets(),
    );
  }
}
