import 'package:faceflutter/components/circular_button.dart';
import 'package:faceflutter/components/profile_button.dart';
import 'package:faceflutter/components/tab_navigation.dart';
import 'package:faceflutter/models/user.dart';
import 'package:faceflutter/utils/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class NavigationTabsDesktop extends StatelessWidget {

  final User user;
  final List<IconData> icons;
  final int indexSelectedTab;
  final Function(int) onTap;

  const NavigationTabsDesktop({Key? key, required this.icons, required this.indexSelectedTab, required this.onTap, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4
          )
        ]
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'facebook', 
              style: TextStyle(
                fontSize: 32,
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2
              )
            ),
          ),
          Expanded(
            child: TabNavigation(
              indexSelectedTab: indexSelectedTab,
              icons: icons,
              onTap: onTap
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ProfileButton(
                  user: user,
                  onTap: (){
                    Navigator.pushNamed(context, '/profile');
                  }
                ),
                CircularButton(
                  icon: LineIcons.search, 
                  iconSize: 30, 
                  onPressed: (){}
                ),
                CircularButton(
                  icon: LineIcons.facebookMessenger, 
                  iconSize: 30, 
                  onPressed: (){}
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}