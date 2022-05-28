import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/features/about/api.about.model.dart';
import 'package:guess_the_text/features/game/api.texts.service.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/theme/widgets/text.link.widget.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionTable extends StatefulWidget {
  const AppVersionTable({
    Key? key,
  }) : super(key: key);

  @override
  State<AppVersionTable> createState() => _AppVersionTableState();
}

class _AppVersionTableState extends State<AppVersionTable> {
  final TextsService textsService = serviceLocator.get();

  String appVersion = '';
  String appBuildNumber = '';
  ApiAbout apiAbout = ApiAbout();

  @override
  void initState() {
    super.initState();

    textsService.getAboutInfo().then((value) => {
          setState(() {
            apiAbout = value;
          })
        });

    PackageInfo.fromPlatform().then((packageInfo) {
      setState(() {
        appVersion = packageInfo.version;
        appBuildNumber = packageInfo.buildNumber;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return DataTable(
      horizontalMargin: 0,
      columnSpacing: 16,
      headingRowHeight: 20,
      dataRowHeight: 24,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(''),
        ),
        DataColumn(
          label: Text(''),
        ),
      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text(localizations.appVersion)),
            DataCell(Text(appVersion)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(localizations.appBuildNumber)),
            DataCell(Text(appBuildNumber)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(localizations.appBackendName)),
            DataCell(Text(apiAbout.name)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(localizations.appBackendVersion)),
            DataCell(Text(apiAbout.version)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(localizations.githubProject)),
            const DataCell(
              ThemedTextLink(
                  displayText: 'Open Source project', hyperlink: 'https://github.com/amwebexpert/guess_the_text'),
            ),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(localizations.appAuthorName)),
            const DataCell(
              ThemedTextLink(displayText: 'André Masson', hyperlink: 'mailto:amwebexpert@gmail.com'),
            ),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(localizations.appAuthorProfile)),
            const DataCell(
              ThemedTextLink(
                  displayText: 'linkedin.com/in/amwebexpert', hyperlink: 'https://www.linkedin.com/in/amwebexpert'),
            ),
          ],
        ),
      ],
    );
  }
}
