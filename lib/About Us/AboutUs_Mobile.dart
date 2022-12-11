import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs_Mobile extends StatefulWidget {
  const AboutUs_Mobile({Key? key}) : super(key: key);

  @override
  State<AboutUs_Mobile> createState() => _AboutUs_MobileState();
}

class _AboutUs_MobileState extends State<AboutUs_Mobile> {
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
            onTap: () async {
              final call = Uri.parse('https://bit.ly/3iV8QRW');
              if (await canLaunchUrl(call)) {
                launchUrl(call);
              } else {
                throw 'Could not launch $call';
              }
            },
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
            onTap: () async {
              final call = Uri.parse('tel: 016 315 751');
              if (await canLaunchUrl(call)) {
                launchUrl(call);
              } else {
                throw 'Could not launch $call';
              }
            },
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
            subtitle: Container(
                child:
                Text("https://bit.ly/3Bm2G3l",style: TextStyle(fontSize: 15,color: Colors.blue,decoration: TextDecoration.underline,),)

            ),
            onTap: () async {
              final call = Uri.parse('https://bit.ly/3Bm2G3l');
              if (await canLaunchUrl(call)) {
                launchUrl(call);
              } else {
                throw 'Could not launch $call';
              }
            },
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
          height: 60,
          color: Colors.black,
          child: Center(child: Text("© Somrron. 2022. All Rights Reserved ", style: TextStyle(fontSize: 15,fontFamily: "f2",fontWeight: FontWeight.bold,letterSpacing: 2,color: Colors.white,decoration: TextDecoration.none),maxLines: 1,overflow: TextOverflow.ellipsis  ,)),
        )




      ],
    );
  }
  get _buildCover{
    return Stack(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("img/logo.jpg"),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  alignment: Alignment.center
                // fit: BoxFit.cover
              )
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: ()=> Navigator.pop(context),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                // color: Colors.white,

              ),
              child: Icon(Icons.arrow_back_ios_new_outlined,size: 30,color: Colors.white,),
            ),
          ),
        )
      ]
    );
  }
}
