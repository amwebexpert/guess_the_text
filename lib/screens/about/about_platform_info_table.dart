import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/services/device/device_info_service.dart';

class PlatformInfoTable extends StatefulWidget {
  const PlatformInfoTable({
    Key? key,
  }) : super(key: key);

  @override
  State<PlatformInfoTable> createState() => _PlatformInfoTableState();
}

class _PlatformInfoTableState extends State<PlatformInfoTable> {
  Map<String, dynamic> info = {};

  @override
  void initState() {
    super.initState();

    DeviceInfoService().loadInfo().then((info) {
      setState(() {
        this.info = info;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Text(
            localizations.deviceInfo,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Table(
            border: TableBorder.all(),
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            children: info.keys.toList().where((element) => !hiddenDeviceProperties.contains(element)).map((key) {
              return TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(key),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    info[key]?.toString() ?? '',
                  ),
                ),
              ]);
            }).toList()),
      ],
    );
  }
}
