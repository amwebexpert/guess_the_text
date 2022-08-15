import 'package:flutter/material.dart';
import '../theme.utils.dart';

/// @see https://stackoverflow.com/a/68507055/704681
class CompactDatatableWidget extends StatelessWidget {
  final List<DataColumn>? columns;
  final List<DataRow> rows;

  const CompactDatatableWidget({Key? key, this.columns, this.rows = const []}) : super(key: key);

  List<DataColumn> _buildDataColumns(int count) => List.filled(count, const DataColumn(label: Text('')));
  int get _columnsCountFromDataRows => rows.isNotEmpty ? rows[0].cells.length : 2;

  @override
  Widget build(BuildContext context) => SizedBox(
      width: double.infinity,
      child: DataTable(
        horizontalMargin: 0,
        columnSpacing: spacing(2),
        headingRowHeight: 26,
        dataRowHeight: 26,
        columns: columns ?? _buildDataColumns(_columnsCountFromDataRows),
        rows: rows,
      ));
}
