import 'package:flutter/material.dart';

class LocalCategoriesWidget extends StatefulWidget {
  const LocalCategoriesWidget({Key? key}) : super(key: key);

  @override
  State<LocalCategoriesWidget> createState() => _LocalCategoriesWidgetState();
}

class _LocalCategoriesWidgetState extends State<LocalCategoriesWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => const Center(child: Text('LOCAL categories widget'));
}
