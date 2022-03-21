import 'package:flutter/material.dart';
import 'package:guess_the_text/theme/app_bar/app_bar_title_widget.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: 'Preferences'),
      ),
      body: const Text('test'),
    );
  }
}
