import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatefulWidget {
  const DrawerItem({Key? key, required this.title, required this.icon}) : super(key: key);
  final String title;
  final IconData icon;

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child:  ListTile(
        leading: Icon(widget.icon),
        title: Text(widget.title,style: TextStyle(fontSize: 20,fontFamily: "f1",fontWeight: FontWeight.bold,letterSpacing: 5),),
      )
    );
  }
}
