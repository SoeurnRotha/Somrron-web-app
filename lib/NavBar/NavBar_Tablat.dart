import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../About Us/AboutUs_responsive.dart';


class NavBar_Tablat extends StatefulWidget {
  const NavBar_Tablat({Key? key}) : super(key: key);

  @override
  State<NavBar_Tablat> createState() => _NavBar_TablatState();
}

class _NavBar_TablatState extends State<NavBar_Tablat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 1
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("សម្រន់/ Samrron", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: "k2"),),
          Row(

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Home", style: TextStyle(fontFamily: "f1",fontWeight: FontWeight.bold,fontSize: 16),),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutUs_responsive())),
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    child: Text("About Us", style: TextStyle(fontFamily: "f1",fontWeight: FontWeight.bold,fontSize: 16),)),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: ()async {
                      final call = Uri.parse('tel:016 315 751');
                      if (await canLaunchUrl(call)) {
                        launchUrl(call);
                      } else {
                        throw 'Could not launch $call';
                      }

                    },


                    child:

                    Row(
                      children: [
                        Icon(Icons.call,size: 20,),
                        Text(" Call Us", style: TextStyle(fontFamily: "f1",fontWeight: FontWeight.bold,fontSize: 16),),
                      ],
                    )),

              ),
            ],
          )
        ],
      ),
    );
  }
}
