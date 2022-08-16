import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';

import '../../../../service.locator.dart';
import '../../../../services/logger/logger.service.dart';
import '../../../../services/text.service/api.category.model.dart';
import '../../../../services/text.service/api.text.model.dart';
import '../../../../services/text.service/sql.db.service.dart';
import '../../../../utils/extensions/string.extensions.dart';

class EditText extends StatefulWidget {
  final ApiCategory category;
  final ApiText text;
  final bool isNew;

  const EditText({Key? key, required this.category, required this.text, required this.isNew}) : super(key: key);

  @override
  EditTextState createState() => EditTextState();
}

class EditTextState extends State<EditText> {
  final LoggerService loggerService = serviceLocator.get();
  final SqlDbService sqlDbService = serviceLocator.get();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _txtTextController = TextEditingController();

  @override
  void initState() {
    if (!widget.isNew) {
      _txtTextController.text = widget.text.original;
    }

    super.initState();
  }

  @override
  void dispose() {
    _txtTextController.dispose();
    super.dispose();
  }

  Future<ApiText?> _saveText(BuildContext context) async {
    final original = _txtTextController.text.trim();
    final normalized = original.removeDiacritics()!.toUpperCase();

    if (widget.isNew) {
      final text = ApiText(original: original, normalized: normalized, uuid: const Uuid().v4());
      return sqlDbService.createText(widget.category, text);
    } else {
      final text = widget.text.copyWith(original: original, normalized: normalized);
      return sqlDbService.updateText(widget.category, text);
    }
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      _saveText(context).then((text) => Navigator.pop(context, text));
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final title = widget.isNew ? Text(localizations.adhocText) : Text(localizations.adhocTextHint);

    return AlertDialog(
      title: title,
      content: Form(
        key: _formKey,
        child: TextFormFieldTextName(controller: _txtTextController, onEnterKeyPressed: onSubmit),
      ),
      actions: <Widget>[
        TextButton(onPressed: () => Navigator.pop(context), child: Text(localizations.actionCancel)),
        ElevatedButton(
          onPressed: onSubmit,
          child: Text(localizations.actionOK),
        ),
      ],
    );
  }
}

class TextFormFieldTextName extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onEnterKeyPressed;

  const TextFormFieldTextName({Key? key, required this.controller, required this.onEnterKeyPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final focusNode = FocusNode(onKey: (node, event) {
      if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
        onEnterKeyPressed();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    });

    return TextFormField(
      autofocus: true,
      focusNode: focusNode,
      enableSuggestions: false,
      maxLines: 3,
      autocorrect: false,
      controller: controller,
      validator: (value) => value.isBlank ? localizations.fieldValidationMandatory : null,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(hintText: localizations.adhocText),
    );
  }
}
