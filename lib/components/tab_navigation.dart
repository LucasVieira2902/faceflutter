import 'package:faceflutter/utils/paleta_cores.dart';
import 'package:flutter/material.dart';

class TabNavigation extends StatelessWidget {

  final List<IconData> icons;
  final int indexSelectedTab;
  final Function(int) onTap;

  const TabNavigation({Key? key, required this.icons, required this.indexSelectedTab, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      tabs: icons.asMap().map((index, icon) => MapEntry(index, Tab(
        icon: Icon(
          icon,
          color: index == indexSelectedTab ? PaletaCores.azulFacebook : Colors.black54,
          size: 30,
        ),
      ))).values.toList(),
      labelColor: Colors.black54,
      indicator: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: PaletaCores.azulFacebook,
            width: 3,
          ),
        ),
      )
    );
  }
}