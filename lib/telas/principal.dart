import 'package:faceflutter/components/navigation_tabs_desktop.dart';
import 'package:faceflutter/components/tab_navigation.dart';
import 'package:faceflutter/data/data.dart';
import 'package:faceflutter/telas/home.dart';
import 'package:faceflutter/utils/responsive.dart';
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

    final bool isDesktop = Responsive.isDesktop(context);

    return DefaultTabController(
      length: _icons.length, 
      child: Scaffold(
        appBar: isDesktop ? PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 65),
          child: NavigationTabsDesktop(
            user: userLogged,
            icons: _icons,
            indexSelectedTab: _indexSelectedTab,
            onTap: (index) {
              setState(() {
                _indexSelectedTab = index;
              });
            }
          ),
        ) : null,
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: _screens
        ),
        bottomNavigationBar: isDesktop ? null : TabNavigation(
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