import 'package:cashback/features/settings/presentation/widgets/lang_settings_widgets.dart';
import 'package:flutter/material.dart';

class LangSettingsView extends StatefulWidget {
  const LangSettingsView({super.key});

  @override
  State<LangSettingsView> createState() => _LangSettingsViewState();
}

class _LangSettingsViewState extends State<LangSettingsView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBar(),
      body: bodyWidgets(),
    );
  }
}
