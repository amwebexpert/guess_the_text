import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ThemedTextLink extends StatelessWidget {
  final String displayText;
  final String hyperlink;

  const ThemedTextLink({
    Key? key,
    required this.displayText,
    required this.hyperlink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Text(displayText,
            style: TextStyle(decoration: TextDecoration.underline, color: Theme.of(context).colorScheme.primary)),
        onTap: () => launchUrlString(hyperlink));
  }
}
