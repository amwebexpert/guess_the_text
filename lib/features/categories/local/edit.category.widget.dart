import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/features/categories/category.icons.map.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:guess_the_text/services/text.service/api.category.model.dart';
import 'package:guess_the_text/services/text.service/sql.db.service.dart';
import 'package:guess_the_text/theme/theme.utils.dart';
import 'package:guess_the_text/utils/extensions/string.extensions.dart';
import 'package:guess_the_text/utils/language.utils.dart';
import 'package:uuid/uuid.dart';

class EditCategory extends StatefulWidget {
  final ApiCategory category;
  final bool isNew;

  const EditCategory({Key? key, required this.category, required this.isNew}) : super(key: key);

  @override
  EditCategoryState createState() => EditCategoryState();
}

class EditCategoryState extends State<EditCategory> {
  final LoggerService loggerService = serviceLocator.get();
  final SqlDbService sqlDbService = serviceLocator.get();

  final TextEditingController txtName = TextEditingController();
  String _langCode = AppLanguage.en.name;
  String _iconName = 'mix';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (!widget.isNew) {
      txtName.text = widget.category.name;
      _langCode = widget.category.langCode;
      _iconName = widget.category.iconName;
    }

    super.initState();
  }

  @override
  void dispose() {
    txtName.dispose();
    super.dispose();
  }

  Future<void> _saveCategory() async {
    final name = txtName.text;
    final iconName = _iconName;
    final langCode = _langCode;

    if (widget.isNew) {
      final uuid = const Uuid().v4(); // TODO put this into a UuidUtils.create() method
      final category = ApiCategory(uuid: uuid, name: name, langCode: langCode, iconName: iconName);
      await sqlDbService.createCategory(category);
    } else {
      final category = widget.category.copyWith(name: name, langCode: langCode, iconName: iconName);
      await sqlDbService.updateCategory(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: widget.isNew ? const Text('Insert category') : const Text('Edit category'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(spacing(2)),
            child: Column(
              children: [
                NoteText(hintText: 'Name', controller: txtName),
                DropdownButtonFormField<String>(
                  items: [
                    DropdownMenuItem(
                      value: AppLanguage.en.name,
                      child: Text(localizations.prefLangEn),
                    ),
                    DropdownMenuItem(
                      value: AppLanguage.fr.name,
                      child: Text(localizations.prefLangFr),
                    ),
                  ],
                  hint: const Text('Language'),
                  value: _langCode,
                  onChanged: (value) {
                    setState(() => _langCode = value!);
                  },
                ),
                DropdownButtonFormField<String>(
                  items: categoryIcons.entries
                      .map((e) => DropdownMenuItem(
                            value: e.key,
                            child: Icon(e.value),
                          ))
                      .toList(),
                  hint: const Text('Category icon'),
                  value: _iconName,
                  onChanged: (value) {
                    setState(() => _iconName = value!);
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _saveCategory();
              Navigator.pop(context);
            }
          },
          child: const Icon(Icons.save)),
    );
  }
}

// TODO move this into theming folder
class NoteText extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const NoteText({Key? key, required this.hintText, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => value.isBlank ? 'Field is mandatory' : null,
      decoration: InputDecoration(
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))), hintText: hintText),
    );
  }
}
