import 'package:flutter/material.dart';
import 'package:guess_the_text/features/about/card.app.description.dart';
import 'package:guess_the_text/features/about/card.header.animation.widget.dart';
import 'package:guess_the_text/features/about/card.header.widget.dart';
import 'package:guess_the_text/features/about/platform.screen.info.table.widget.dart';
import 'package:guess_the_text/features/about/privacy.policy.widget.dart';
import 'package:guess_the_text/theme/theme.utils.dart';

import 'app.version.table.widget.dart';
import 'platform.info.table.widget.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(spacing(2)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CardHeaderWidget(),
                Padding(
                  padding: EdgeInsets.all(spacing(1)),
                  child: const CardHeaderAnimation(),
                ),
                const PrivacyPolicyWidget(),
                const AppVersionTable(),
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
          ),
        ),
      ),
    );
  }
}
