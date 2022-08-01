import 'package:flutter/material.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:guess_the_text/services/text.service/api.category.model.dart';
import 'package:guess_the_text/services/text.service/sql.db.service.dart';
import 'package:guess_the_text/theme/theme.utils.dart';
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
  final TextEditingController txtLangCode = TextEditingController();
  final TextEditingController txtIconName = TextEditingController();

  @override
  void initState() {
    if (!widget.isNew) {
      txtName.text = widget.category.name;
      txtLangCode.text = widget.category.langCode;
      txtIconName.text = widget.category.iconName;
    }

    super.initState();
  }

  Future<void> _saveCategory() async {
    final name = txtName.text;
    final iconName = txtIconName.text;
    final langCode = txtLangCode.text;

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
    return Scaffold(
      appBar: AppBar(
        title: widget.isNew ? const Text('Insert category') : const Text('Edit category'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NoteText(description: 'Name', controller: txtName),
            NoteText(description: 'Language', controller: txtLangCode),
            NoteText(description: 'Category icon', controller: txtIconName),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _saveCategory();
            Navigator.pop(context);
          },
          child: const Icon(Icons.save)),
    );
  }
}

// TODO move this into theming folder
class NoteText extends StatelessWidget {
  final String description;
  final TextEditingController controller;

  const NoteText({Key? key, required this.description, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(spacing(2)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: description),
      ),
    );
  }
}
