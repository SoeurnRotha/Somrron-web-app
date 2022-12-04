import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header_Mobile extends StatefulWidget {
  const Header_Mobile({Key? key}) : super(key: key);

  @override
  State<Header_Mobile> createState() => _Header_MobileState();
}

class _Header_MobileState extends State<Header_Mobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.white,
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //           offset: Offset.zero,
      //           color: Colors.black12,
      //           blurRadius: 5,
      //           spreadRadius: 5
      //       ),
      //     ]
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          welcomText(),
          headerImage(),


        ],
      ),
    );
  }

  Widget headerImage(){
    return Container(
      width: 220,
      height: 250,
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
          child: Text("សូមស្វាគមន៏",style: TextStyle(fontFamily: "k2",fontSize: 30,fontWeight: FontWeight.bold),),
        ),
        Container(
          child: Text("មកកាន់",style: TextStyle(fontFamily: "k2",fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        Container(
          child: Text("សម្រន់",style: TextStyle(fontFamily: "k2",fontSize: 30,fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}
