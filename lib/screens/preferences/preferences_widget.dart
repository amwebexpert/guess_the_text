import 'package:flutter/material.dart';
import 'package:guess_the_text/theme/app_bar/app_bar_title_widget.dart';

class PreferencesWidget extends StatefulWidget {
  const PreferencesWidget({Key? key}) : super(key: key);

  @override
  _PreferencesWidgetState createState() => _PreferencesWidgetState();
}

class _PreferencesWidgetState extends State<PreferencesWidget> {
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
