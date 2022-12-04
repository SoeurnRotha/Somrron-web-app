import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:samrron/Header/Header_Mobile.dart';
import 'package:samrron/Header/Header_Tablat.dart';
import 'package:samrron/Header/Header_Web.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Header_Mobile(),
      tablet: Header_Tablat(),
      desktop: Header_Web(),
    );
  }
}
