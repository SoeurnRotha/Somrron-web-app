import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs_Web extends StatefulWidget {
  const AboutUs_Web({Key? key}) : super(key: key);

  @override
  State<AboutUs_Web> createState() => _AboutUs_WebState();
}

class _AboutUs_WebState extends State<AboutUs_Web> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildCover,
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 10),
          child: Container(
            child: Text("The Office",style:  TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold,color: Colors.grey,decoration: TextDecoration.none),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.deepPurpleAccent,
                child: Icon(Icons.pin_drop,color: Colors.white,)
            ),
            title: Text("Address", style: TextStyle(fontSize: 18,fontFamily: "f2", fontWeight: FontWeight.bold),),
            subtitle: Container(child: Text("Street 460 , Toul Tom Poung, Chamkar Mon District, Phnom Penh, Cambodia")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.deepPurpleAccent,
                child: Icon(Icons.call,color: Colors.white,)
            ),
            title: Text("Phone", style: TextStyle(fontSize: 18,fontFamily: "f2", fontWeight: FontWeight.bold),),
            subtitle: Container(child: Text("016 315 751")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue,
                child: Icon(Icons.facebook,color: Colors.white,)
            ),
            title: Text("Facebook", style: TextStyle(fontSize: 18,fontFamily: "f2", fontWeight: FontWeight.bold),),
            subtitle: Container(child: Text("https://bit.ly/3U9s5DW",style: TextStyle(fontSize: 15,color: Colors.blue,decoration: TextDecoration.underline,),)),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 10),
          child: Container(
            child: Text("Business Hours",style:  TextStyle(fontSize: 20,fontFamily: "f2",fontWeight: FontWeight.bold,color: Colors.grey,decoration: TextDecoration.none),),
          ),
        ),

        ListTile(
          leading: Icon(Icons.access_time_filled_sharp),
          title: Text("Monday - Sunday", style: TextStyle(fontSize: 18,fontFamily: "f2",fontWeight: FontWeight.bold),),
        ),

        SizedBox(height: 30,),

        Container(
          height: 100,
          color: Colors.black,
          child: Center(child: Text("© Somrron. 2022. All Rights Reserved ", style: TextStyle(fontSize: 15,fontFamily: "f2",fontWeight: FontWeight.bold,letterSpacing: 2,color: Colors.white,decoration: TextDecoration.none),maxLines: 1,overflow: TextOverflow.ellipsis  ,)),
        )




      ],
    );
  }
  get _buildCover{
    return Container(
      height: 600,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("img/logo.jpg"),
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              alignment: Alignment.center
            // fit: BoxFit.cover
          )
      ),
    );
  }
}
