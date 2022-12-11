import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NavBar_Mobile extends StatefulWidget {
  const NavBar_Mobile({Key? key}) : super(key: key);

  @override
  State<NavBar_Mobile> createState() => _NavBar_MobileState();
}

class _NavBar_MobileState extends State<NavBar_Mobile> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: ()=> Scaffold.of(context).openDrawer(),
            ),
            Container(
              // alignment: Alignment.center,
              margin: EdgeInsets.only(right: 185),
              child: Text("សម្រន់",style: TextStyle(fontSize: 30,fontFamily: "k1"),),
            )
          ],
        ),
      ),
    );
  }
}
