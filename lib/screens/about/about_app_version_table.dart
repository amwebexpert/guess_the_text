import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/services/hangman/hangman_service.dart';
import 'package:guess_the_text/services/hangman/model/api_about.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AppVersionTable extends StatefulWidget {
  const AppVersionTable({
    Key? key,
  }) : super(key: key);

  @override
  State<AppVersionTable> createState() => _AppVersionTableState();
}

class _AppVersionTableState extends State<AppVersionTable> {
  String appVersion = '';
  String appBuildNumber = '';
  ApiAbout apiAbout = ApiAbout();

  @override
  void initState() {
    super.initState();

    HangmanService().getAboutInfo().then((value) => {
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
      dataRowHeight: 20,
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
            DataCell(Text(localizations.appAuthorName)),
            const DataCell(Text('André Masson')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(localizations.email)),
            DataCell(
              InkWell(
                  child: const Text('amwebexpert@gmail.com',
                      style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                  onTap: () => launch('mailto:amwebexpert@gmail.com')),
            ),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(localizations.appAuthorProfile)),
            DataCell(
              InkWell(
                  child: const Text('linkedin.com/in/amwebexpert',
                      style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                  onTap: () => launch('https://www.linkedin.com/in/amwebexpert')),
            ),
          ],
        ),
      ],
    );
  }
}
