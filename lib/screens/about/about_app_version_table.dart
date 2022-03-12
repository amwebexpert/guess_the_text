import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/services/device/device_info_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

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

  @override
  void initState() {
    super.initState();

    PackageInfo.fromPlatform().then((packageInfo) {
      setState(() {
        appVersion = packageInfo.version;
        appBuildNumber = packageInfo.buildNumber;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final DeviceInfoService deviceInfosService = DeviceInfoService();
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
            DataCell(Text(localizations.appAuthorName)),
            const DataCell(Text('André Masson')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(localizations.email)),
            const DataCell(Text('amwebexpert@gmail.com')),
          ],
        ),
      ],
    );
  }
}
