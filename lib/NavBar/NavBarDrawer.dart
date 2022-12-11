import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samrron/About%20Us/AboutUs_responsive.dart';
import 'package:url_launcher/url_launcher.dart';

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
          GestureDetector(
              child: DrawerItem(title: '016 315 751', icon: Icons.call),
            onTap: ()async {
              final call = Uri.parse('tel:016 315 751');
              if (await canLaunchUrl(call)) {
                launchUrl(call);
              } else {
                throw 'Could not launch $call';
              }
            },
          ),
        ],
      ),
    );
  }
}
