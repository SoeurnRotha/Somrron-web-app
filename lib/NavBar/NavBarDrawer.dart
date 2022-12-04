import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samrron/About%20Us/AboutUs_responsive.dart';

import '../About Us/AboutUs_Mobile.dart';
import 'DrawerItems.dart';


class NavBarDrawer extends StatefulWidget {

  const NavBarDrawer({Key? key}) : super(key: key);

  @override
  State<NavBarDrawer> createState() => _NavBarDrawerState();
}

class _NavBarDrawerState extends State<NavBarDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
     color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            mouseCursor: MaterialStateMouseCursor.clickable,

              child: DrawerItem(title: 'About us', icon: Icons.info),
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs_responsive())),
          ),
          DrawerItem(title: '016 315 751', icon: Icons.call),
        ],
      ),
    );
  }
}
