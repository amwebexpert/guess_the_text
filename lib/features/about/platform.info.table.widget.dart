import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/device/device.info.service.dart';
import 'package:guess_the_text/theme/theme.utils.dart';

class PlatformInfoTable extends StatefulWidget {
  const PlatformInfoTable({Key? key}) : super(key: key);

  @override
  State<PlatformInfoTable> createState() => _PlatformInfoTableState();
}

class _PlatformInfoTableState extends State<PlatformInfoTable> {
  final DeviceInfoService _deviceInfoService = serviceLocator.get();
  Map<String, dynamic> _info = {};

  @override
  void initState() {
    super.initState();

    _deviceInfoService.loadAboutDeviceInfo().then((info) {
      if (mounted) {
        setState(() {
          _info = info;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: spacing(2)),
          child: Text(
            localizations.deviceInfo,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Table(
            border: TableBorder.all(),
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            children: _info.keys.toList().map((key) {
              return TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(spacing(1)),
                  child: Text(key),
                ),
                Padding(
                  padding: EdgeInsets.all(spacing(1)),
                  child: Text(
                    _info[key]?.toString() ?? '',
                  ),
                ),
              ]);
            }).toList()),
      ],
    );
  }
}
