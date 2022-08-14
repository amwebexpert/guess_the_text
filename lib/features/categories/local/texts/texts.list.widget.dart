import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../service.locator.dart';
import '../../../../services/text.service/api.category.model.dart';
import '../../../../services/text.service/api.text.model.dart';
import '../../../../services/text.service/sql.db.service.dart';
import '../../../../theme/app.theme.dart';
import '../../../../theme/theme.utils.dart';
import '../../../../theme/widgets/app.bar.title.widget.dart';
import '../../../../theme/widgets/full.screen.bg.image.widget.dart';
import '../../../../theme/widgets/snackbar/snackbar.model.dart';
import '../../../../theme/widgets/snackbar/snackbar.utils.dart';
import '../../../challenge/on.the.fly.challenge.model.dart';
import 'edit.text.widget.dart';

class TextsListWidget extends StatefulWidget {
  static const String backgroundImage = 'assets/images/backgrounds/background-pexels-pixabay-461940.jpg';

  const TextsListWidget({Key? key, required this.category, required this.initialTexts}) : super(key: key);

  final ApiCategory category;
  final List<ApiText> initialTexts;

  @override
  State<TextsListWidget> createState() => _TextsListWidgetState();
}

class _TextsListWidgetState extends State<TextsListWidget> {
  final SqlDbService sqlDbService = serviceLocator.get();
  late List<ApiText> texts;

  @override
  void initState() {
    super.initState();
    texts = widget.initialTexts;
  }

  Future<void> _createText() async {
    final ApiText? result = await showDialog(
        context: context, builder: (_) => EditText(category: widget.category, text: const ApiText(), isNew: true));

    if (result != null) {
      setState(() => texts.add(result));
    }
  }

  Future<void> _updateText(ApiText text, int index) async {
    final ApiText? result = await showDialog(
        context: context, builder: (_) => EditText(category: widget.category, text: text, isNew: false));

    if (result != null) {
      setState(() => texts[index] = result);
    }
  }

  Future<void> _deleteText(ApiText text, int index) async {
    await sqlDbService.deleteText(text);
    setState(() => texts.remove(text));

    if (!mounted) {
      return;
    }

    final AppLocalizations localizations = AppLocalizations.of(context)!;
    showAppSnackbar(
        context: context,
        message: localizations.categoryDeletedMessage(text.original), // TODO Translate me like category
        type: SnackbarType.info,
        milliseconds: 4 * 1000,
        action: SnackBarAction(
            label: 'UNDO', // TODO Translate me
            onPressed: () {
              sqlDbService.createText(widget.category, text).then((restoredText) {
                setState(() => texts.insert(index, restoredText));
              });
            }));
  }

  void _generateQR(ApiText textModel) {
    Navigator.pushNamed(context, '/onTheFlyChallenge', arguments: OnTheFlyChallenge(text: textModel.original));
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: '${localizations.category} - ${widget.category.name}'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: _createText, child: const Icon(Icons.add)),
        body: FullScreenAssetBackground(
          assetImagePath: TextsListWidget.backgroundImage,
          child: Padding(
            padding: EdgeInsets.all(spacing(2)),
            child: ListView.builder(
                itemCount: texts.length,
                itemBuilder: (context, index) {
                  final textModel = texts[index];
                  final id = textModel.id.toString();

                  return Dismissible(
                      key: Key(id),
                      onDismissed: (direction) => _deleteText(textModel, index),
                      child: Card(
                        key: ValueKey(id),
                        child: ListTile(
                          title: Text(textModel.original, style: Theme.of(context).textTheme.bodyText1),
                          onTap: () => _updateText(textModel, index),
                          trailing: ElevatedButton(
                              style: listTileTralingButtonStyle,
                              child: const Icon(Icons.qr_code),
                              onPressed: () => _generateQR(textModel)),
                        ),
                      ));
                }),
          ),
        ));
  }
}
