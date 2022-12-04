import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

import 'NavBar_Mobile.dart';
import 'NavBar_Tablat.dart';
import 'NavBar_Web.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavBar_Mobile(),
      tablet: NavBar_Tablat(),
      desktop: NavBar_Web(),
    );
  }
}
