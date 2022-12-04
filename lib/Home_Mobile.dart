import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samrron/Admin_uploadData/Insert/Product_Insert.dart';
import 'package:samrron/Admin_uploadData/Upldate%20And%20Delete/Product%20Update%20And%20Delete.dart';

class Home_Mobile extends StatefulWidget {
  const Home_Mobile({Key? key}) : super(key: key);

  @override
  State<Home_Mobile> createState() => _Home_MobileState();
}

class _Home_MobileState extends State<Home_Mobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: _buildBody,
    );
  }
  get _buildAppbar{
    return AppBar(
      backgroundColor: Colors.white,
      title: Text("Home",style: TextStyle(fontFamily: "title",fontSize: 25,color: Colors.black),),
      centerTitle: true,
    );
  }
  get _buildBody{
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _welText,
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> InsertData()));
              },
              child: _buildPage("Insert Data"),
            ),
            InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Update_And_Delete())),
              child: _buildPage("Update And Delete"),
            ),



          ],
        ),
      ),
    );
  }

  get _welText{
    return Container(
      child: Column(
        children: [
          Text("សូមស្វាគមន៏",style: TextStyle(fontSize: 35,fontFamily: "k2"),),
          Text("មកកាន់",style: TextStyle(fontSize: 20,fontFamily: "k2"),),
          Text("សម្រន់",style: TextStyle(fontSize: 35,fontFamily: "k2"),),

        ],
      ),
    );
  }
  Widget _buildPage(String text){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(-7,-8),
                color: Colors.white,
                blurRadius: 5,
                spreadRadius: 4
            ),
            BoxShadow(
              offset: Offset(7,8),
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: 4
            )
          ],
          borderRadius: BorderRadius.circular(10),

        ),

        child: Center(child: Text(text,style: TextStyle(fontFamily: "des",fontSize: 25,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
