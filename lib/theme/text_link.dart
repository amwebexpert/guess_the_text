import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThemedTextLink extends StatelessWidget {
  final String displayText;
  final String hyperlink;

  const ThemedTextLink({
    Key? key,
    required this.displayText,
    required this.hyperlink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
      child: Text(displayText, style: const TextStyle(decoration: TextDecoration.underline, color: Colors.yellow)),
      onTap: () => launch(hyperlink));
}
