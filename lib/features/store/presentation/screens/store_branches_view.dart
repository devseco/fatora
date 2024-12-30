import 'package:cashback/features/store/presentation/widgets/store_branches_widgets.dart';
import 'package:flutter/material.dart';

class StoreBranchesView extends StatefulWidget {
  const StoreBranchesView({super.key});

  @override
  State<StoreBranchesView> createState() => _StoreBranchesViewState();
}

class _StoreBranchesViewState extends State<StoreBranchesView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: bodyWidgets(),
    );
  }
}
