import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:samrron/ListProdict/ListProduct_Mobile.dart';
import 'package:samrron/ListProdict/ListProduct_Tablat.dart';
import 'package:samrron/ListProdict/ListProduct_Web.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ListProduct_Mobile(),
      tablet: ListProduct_Tablat(),
      desktop: ListProduct_Web(),
    );
  }
}
