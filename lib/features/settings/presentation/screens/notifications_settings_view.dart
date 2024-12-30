import 'package:cashback/features/settings/presentation/widgets/notifications_settings_widgets.dart';
import 'package:flutter/material.dart';
class NotificationsSettingsView extends StatefulWidget {
  const NotificationsSettingsView({super.key});

  @override
  State<NotificationsSettingsView> createState() => _NotificationsSettingsViewState();
}

class _NotificationsSettingsViewState extends State<NotificationsSettingsView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBar(),
      body: bodyWidgets(),
    );
  }
}
