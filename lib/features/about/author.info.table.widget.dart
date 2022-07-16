import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/features/about/contributor.model.dart';
import 'package:guess_the_text/theme/widgets/compact.datatable.widget.dart';

import '../../theme/widgets/text.link.widget.dart';

class AuthorInfoTable extends StatelessWidget {
  AuthorInfoTable({Key? key}) : super(key: key);

  final List<Contributor> _contributors = <Contributor>[
    Contributor(
        name: 'André Masson', email: 'amwebexpert@gmail.com', linkedIn: 'https://www.linkedin.com/in/amwebexpert'),
    Contributor(name: 'Jef van der Avoirt', email: 'jef.v.d.a@live.be', linkedIn: 'https://www.linkedin.com/in/jefvda'),
  ];

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return CompactDatatableWidget(
      columns: <DataColumn>[
        DataColumn(
          label: Text(localizations.appAuthorName),
        ),
        DataColumn(
          label: Text(localizations.appAuthorProfile),
        ),
      ],
      rows: _contributors
          .map((contributor) => DataRow(cells: <DataCell>[
                DataCell(
                  ThemedTextLink(displayText: contributor.name, hyperlink: 'mailto:${contributor.email}'),
                ),
                DataCell(
                  ThemedTextLink(displayText: 'Linked-in', hyperlink: contributor.linkedIn),
                )
              ]))
          .toList(),
    );
  }
}
