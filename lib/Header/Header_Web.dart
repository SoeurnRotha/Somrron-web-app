import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header_Web extends StatefulWidget {
  const Header_Web({Key? key}) : super(key: key);

  @override
  State<Header_Web> createState() => _Header_WebState();
}

class _Header_WebState extends State<Header_Web> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 5
          ),
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          headerImage(),
          welcomText(),


        ],
      ),
    );
  }

  Widget headerImage(){
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(

        image: DecorationImage(
          image: AssetImage("img/01.png"),
        )
      ),
    );
  }

  Widget welcomText(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text("សូមស្វាគមន៏",style: TextStyle(fontFamily: "k2",fontSize: 80,fontWeight: FontWeight.bold),),
        ),
        Container(
          child: Text("មកកាន់",style: TextStyle(fontFamily: "k2",fontSize: 40,fontWeight: FontWeight.bold),),
        ),
        Container(
          child: Text("សម្រន់",style: TextStyle(fontFamily: "k2",fontSize: 80,fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}
