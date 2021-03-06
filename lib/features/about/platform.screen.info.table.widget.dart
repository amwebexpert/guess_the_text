import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PlatformScreenInfoTable extends StatelessWidget {
  const PlatformScreenInfoTable({Key? key}) : super(key: key);

  String _getScreenType(BuildContext context) => ResponsiveValue(
        context,
        // TODO Localize me
        defaultValue: 'MOBILE',
        valueWhen: const [
          Condition.equals(name: TABLET, value: 'TABLET'),
          Condition.equals(name: DESKTOP, value: 'DESKTOP')
        ],
      ).value!;

  @override
  Widget build(BuildContext context) {
    final screenType = _getScreenType(context);
    final screen = MediaQuery.of(context);

    return Column(
      children: [
        Text(
          'Screen specifications', // TODO Localize me
          style: Theme.of(context).textTheme.bodyText2,
        ),
        DataTable(
          horizontalMargin: 0,
          columnSpacing: 16,
          headingRowHeight: 20,
          dataRowHeight: 24,
          columns: const <DataColumn>[DataColumn(label: Text('')), DataColumn(label: Text(''))],
          // TODO Localize me (all rows)
          rows: <DataRow>[
            DataRow(cells: <DataCell>[const DataCell(Text('Type')), DataCell(Text(screenType))]),
            DataRow(cells: <DataCell>[
              const DataCell(Text('Width')),
              DataCell(Text('${window.physicalSize.width.toInt()} px'))
            ]),
            DataRow(cells: <DataCell>[
              const DataCell(Text('Height')),
              DataCell(Text('${window.physicalSize.height.toInt()} px'))
            ]),
            DataRow(cells: <DataCell>[
              const DataCell(Text('Pixel ratio')),
              DataCell(Text(window.devicePixelRatio.toString()))
            ]),
            DataRow(cells: <DataCell>[
              const DataCell(Text('Locical width')),
              DataCell(Text('${screen.size.width.toInt()} px'))
            ]),
            DataRow(cells: <DataCell>[
              const DataCell(Text('Logical height')),
              DataCell(Text('${screen.size.height.toInt()} px'))
            ]),
            DataRow(cells: <DataCell>[
              const DataCell(Text('Orientation')),
              DataCell(Text(screen.orientation.name.toString()))
            ]),
            DataRow(cells: <DataCell>[
              const DataCell(Text('Text scale factor')),
              DataCell(Text(screen.textScaleFactor.toString()))
            ]),
          ],
        ),
      ],
    );
  }
}
