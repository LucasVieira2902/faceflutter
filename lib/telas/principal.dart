import 'package:faceflutter/components/tab_navigation.dart';
import 'package:faceflutter/telas/home.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  final List<Widget> _screens = [
    const Home(),
    const Scaffold(backgroundColor: Colors.green),
    const Scaffold(backgroundColor: Colors.yellow),
    const Scaffold(backgroundColor: Colors.purple),
    const Scaffold(backgroundColor: Colors.black54),
    const Scaffold(backgroundColor: Colors.orange)
  ];	

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu
  ];

  int _indexSelectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length, 
      child: Scaffold(
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: _screens
        ),
        bottomNavigationBar: TabNavigation(
          indexSelectedTab: _indexSelectedTab,
          icons: _icons,
          onTap: (index) {
            setState(() {
              _indexSelectedTab = index;
            });
          }
        ),
      )
    );
  }
}