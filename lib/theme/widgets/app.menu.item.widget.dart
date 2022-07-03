import 'package:flutter/material.dart';
import '/utils/icon.utils.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({Key? key, required this.titleLabel, required this.iconName, required this.onTap})
      : super(key: key);

  final String titleLabel;
  final String iconName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: Hero(
            tag: 'app-menu-item-$iconName',
            child: Icon(iconsMap[iconName]),
          ),
          trailing: const Icon(Icons.arrow_right),
          title: Text(titleLabel),
          onTap: onTap,
        ),
        const Divider(thickness: 2),
      ],
    );
  }
}
