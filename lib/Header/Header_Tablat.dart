import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header_Tablat extends StatefulWidget {
  const Header_Tablat({Key? key}) : super(key: key);

  @override
  State<Header_Tablat> createState() => _Header_TablatState();
}

class _Header_TablatState extends State<Header_Tablat> {
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
      width: 280,
      height: 300,
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
          child: Text("សូមស្វាគមន៏",style: TextStyle(fontFamily: "k2",fontSize: 60,fontWeight: FontWeight.bold),),
        ),
        Container(
          child: Text("មកកាន់",style: TextStyle(fontFamily: "k2",fontSize: 40,fontWeight: FontWeight.bold),),
        ),
        Container(
          child: Text("សម្រន់",style: TextStyle(fontFamily: "k2",fontSize: 60,fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}
