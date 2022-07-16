import 'package:flutter/material.dart';
import 'package:guess_the_text/features/about/author.info.table.widget.dart';
import 'package:guess_the_text/theme/widgets/height.spacer.widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '/features/about/card.app.description.dart';
import '/features/about/card.header.widget.dart';
import '/features/about/platform.screen.info.table.widget.dart';
import '/theme/theme.utils.dart';
import '/theme/widgets/made.with.love.widget.dart';
import 'app.version.table.widget.dart';
import 'platform.info.table.widget.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isColumnLayout = ResponsiveWrapper.of(context).isSmallerThan(TABLET);

    return AboutCardPanel(
      child: Padding(
        padding: EdgeInsets.all(spacing(1)),
        child: Column(
          children: [
            ResponsiveRowColumn(
              rowMainAxisAlignment: MainAxisAlignment.spaceAround,
              layout: isColumnLayout ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
              children: [
                const ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: CardHeaderWidget(),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Column(
                    children: [
                      const HeightSpacer(spacingUnitCount: 6),
                      const AppVersionTable(),
                      const HeightSpacer(),
                      AuthorInfoTable()
                    ],
                  ),
                ),
              ],
            ),
            const HeightSpacer(),
            const CardAppDescriptionWidget(),
            const HeightSpacer(),
            const PlatformInfoTable(),
            const HeightSpacer(),
            const PlatformScreenInfoTable(),
            const HeightSpacer(),
            const MadeWithLoveWidget(),
          ],
        ),
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
