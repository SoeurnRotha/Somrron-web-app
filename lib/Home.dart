import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:samrron/Header/Header.dart';
import 'package:samrron/ListProdict/ListProduct.dart';
import 'package:samrron/NavBar/NavBar.dart';

import 'NavBar/NavBarDrawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context ,size) => Scaffold(

        drawer: size.deviceScreenType == DeviceScreenType.mobile ? NavBarDrawer() : null,

        body: ListView(
          children: [
            NavBar(),
            Header(),
            SizedBox(height: 30,),
            ListProduct(),

          ],

        ),
      ),
    );
  }
}
