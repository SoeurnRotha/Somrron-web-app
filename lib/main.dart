import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:samrron/Home.dart';
import 'package:samrron/Web_app.dart';

import 'MobileApp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options:FirebaseOptions(
          apiKey: "AIzaSyB5nHsjd0n1Peh3SK2glt7I0LshbcjulRA",
          authDomain: "somrron-web.firebaseapp.com",
          projectId: "somrron-web",
          storageBucket: "somrron-web.appspot.com",
          messagingSenderId: "413686887200",
          appId: "1:413686887200:web:8ac4405b8165a4a30edd45",
          measurementId: "G-18FYJ4PK15",
        )
    );
  }else{
    await Firebase.initializeApp();
  }



  runApp(MySomrronWeb());
}

class MySomrronWeb extends StatefulWidget {
  const MySomrronWeb({Key? key}) : super(key: key);

  @override
  State<MySomrronWeb> createState() => _MySomrronWebState();
}

class _MySomrronWebState extends State<MySomrronWeb> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      home: _buildScaffold
    );
  }

  get _buildScaffold{
    return Scaffold(
      body: kIsWeb ? WebApp() : MobileApp(),
    );
  }
}

