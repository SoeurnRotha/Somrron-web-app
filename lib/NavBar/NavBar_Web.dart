import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../About Us/AboutUs_responsive.dart';


class NavBar_Web extends StatefulWidget {
  const NavBar_Web({Key? key}) : super(key: key);

  @override
  State<NavBar_Web> createState() => _NavBar_WebState();
}

class _NavBar_WebState extends State<NavBar_Web> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,

          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          // Text("The Little Green", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: "f1"),),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("img/logo.jpg"),
                fit: BoxFit.cover

              )
            ),
          ),
          Row(

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("ផ្ទះ", style: TextStyle(fontFamily: "k1",fontWeight: FontWeight.bold,fontSize: 30),),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutUs_responsive())),
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    child: Text("អំពីយើង", style: TextStyle(fontFamily: "k1",fontWeight: FontWeight.bold,fontSize: 30),)),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("០១៦ ៣១៥ ៧៥១", style: TextStyle(fontFamily: "k1",fontWeight: FontWeight.bold,fontSize: 30),),
              ),

            ],
          )
        ],
      ),
    );
  }
}
