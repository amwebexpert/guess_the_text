import 'package:flutter/material.dart';

import '../../../../service.locator.dart';
import '../../../../services/text.service/api.category.model.dart';
import '../../../../services/text.service/api.text.model.dart';
import '../../../../services/text.service/sql.db.service.dart';
import '../../loading.error.widget.dart';
import '../../loading.widget.dart';
import 'texts.list.widget.dart';

class LocalTextsWidget extends StatefulWidget {
  final ApiCategory category;
  const LocalTextsWidget({Key? key, required this.category}) : super(key: key);

  @override
  State<LocalTextsWidget> createState() => _LocalTextsWidgetState();
}

class _LocalTextsWidgetState extends State<LocalTextsWidget> {
  final SqlDbService sqlDbService = serviceLocator.get();

  late Future<List<ApiText>> _textsFuture;

  @override
  void initState() {
    super.initState();
    _textsFuture = sqlDbService.getTexts(widget.category);
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<List<ApiText>>(
      future: _textsFuture,
      builder: ((context, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? snapshot.hasData
                ? TextsListWidget(category: widget.category, initialTexts: snapshot.data!)
                : const LoadingErrorWidget()
            : const ElementsLoadingWidget();
      }));
}
