import 'package:flutter/material.dart';
import 'package:guess_the_text/features/about/card.app.description.dart';
import 'package:guess_the_text/features/about/card.header.widget.dart';
import 'package:guess_the_text/features/about/platform.screen.info.table.widget.dart';
import 'package:guess_the_text/theme/theme.utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app.version.table.widget.dart';
import 'platform.info.table.widget.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isColumnLayout = ResponsiveWrapper.of(context).isSmallerThan(TABLET);

    return AboutCardPanel(
      child: Column(
        children: [
          ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.spaceAround,
            layout: isColumnLayout ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
            children: const [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: CardHeaderWidget(),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: AppVersionTable(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(spacing(1), spacing(3), spacing(1), spacing(1.25)),
            child: const CardAppDescriptionWidget(),
          ),
          Padding(
            padding: EdgeInsets.all(spacing(1)),
            child: const PlatformInfoTable(),
          ),
          Padding(
            padding: EdgeInsets.all(spacing(1)),
            child: const PlatformScreenInfoTable(),
          ),
        ],
      ),
    );
  }
}

class AboutCardPanel extends StatelessWidget {
  final Widget child;

  const AboutCardPanel({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(spacing(2)),
          child: SingleChildScrollView(child: child),
        ),
      ),
    );
  }
}
