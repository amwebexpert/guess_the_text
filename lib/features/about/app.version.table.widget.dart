import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/features/about/contributor.model.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '/features/about/api.about.model.dart';
import '/features/about/privacy.policy.widget.dart';
import '/features/game/api.texts.service.dart';
import '/service.locator.dart';
import '/theme/widgets/text.link.widget.dart';
import 'card.app.connectivity.status.dart';

class AppVersionTable extends StatefulWidget {
  const AppVersionTable({Key? key}) : super(key: key);

  @override
  State<AppVersionTable> createState() => _AppVersionTableState();
}

class _AppVersionTableState extends State<AppVersionTable> {
  final TextsService _textsService = serviceLocator.get();

  String _appVersion = '';
  String _appBuildNumber = '';
  ApiAbout _apiAbout = const ApiAbout();
  final Contributor _contributor = Contributor(name:  'André Masson', email: 'amwebexpert@gmail.com', linkedIn: 'https://www.linkedin.com/in/amwebexpert');

  @override
  void initState() {
    super.initState();

    _textsService.getAboutInfo().then((value) => {
          if (mounted)
            setState(() {
              _apiAbout = value;
            })
        });

    PackageInfo.fromPlatform().then((packageInfo) {
      if (mounted) {
        setState(() {
          _appVersion = packageInfo.version;
          _appBuildNumber = packageInfo.buildNumber;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        const PrivacyPolicyWidget(),
        DataTable(
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
                DataCell(Text(_appVersion)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text(localizations.appBuildNumber)),
                DataCell(Text(_appBuildNumber)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text(localizations.appBackendName)),
                DataCell(Text(_apiAbout.name)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text(localizations.appBackendVersion)),
                DataCell(Text(_apiAbout.version)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text(localizations.connectivityStatus)),
                const DataCell(ConnectivityStatusWidget()),
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
                DataCell(
                  ThemedTextLink(displayText: _contributor.name, hyperlink: 'mailto:${_contributor.email}'),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text(localizations.appAuthorProfile)),
                DataCell(
                  ThemedTextLink(
                      displayText: _contributor.linkedIn, hyperlink: _contributor.linkedIn),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
