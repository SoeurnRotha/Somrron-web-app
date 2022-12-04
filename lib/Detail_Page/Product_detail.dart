import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'DetailProduct_Mobile.dart';
import 'DetailProduct_Tablat.dart';
import 'DetailProduct_Web.dart';
class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key, required this.image, required this.name, required this.price, required this.proInfo, required this.desInfo}) : super(key: key);


  final String image;
  final String name;
  final String price;
  final String proInfo;
  final String desInfo;


  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: DetailProduct_Mobile(image: widget.image,name: widget.name, price: widget.price, proInfo: widget.proInfo, desInfo: widget.desInfo,),
        tablet: DetailProduct_Tablat(image: widget.image,name: widget.name, price: widget.price, proInfo: widget.proInfo, desInfo: widget.desInfo,),
        desktop: DetailProduct_Web(image: widget.image,name: widget.name, price: widget.price, proInfo: widget.proInfo, desInfo: widget.desInfo,),
      ),

    );
  }
}
