import 'package:cashback/features/settings/presentation/widgets/settings_widgets.dart';
import 'package:flutter/material.dart';
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: bodyWidgets(),

    );
  }
}
