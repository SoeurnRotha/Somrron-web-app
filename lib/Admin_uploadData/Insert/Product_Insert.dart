
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final productController = TextEditingController();
  final descriptionController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();


  CollectionReference collectionReference = FirebaseFirestore.instance.collection("Products");

  void addData() async{
    final imageURL = await uploadImage(_image!);
    collectionReference.add({
      "img": imageURL,
      "name" : nameController.text.trim(),
      "price" : priceController.text,
      "proInfo" : productController.text,
      "desInfo" : descriptionController.text,

    }).whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text("You Add your product successfuly",style: TextStyle(fontFamily: "f2",color: Colors.white,fontSize: 18),),
              ),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )
      );
    });

  }


  File? _image;
  final picker = ImagePicker();

  final String downloadURL = "";

  Future imagePicker() async {

    try{
      final pick = await picker.pickImage(source: ImageSource.gallery);
      setState((){
        if(pick != null){
          _image = File(pick.path);
        }else{
          print("No image seleted");
        }
      });
    }on PlatformException catch(e){
      print(e.toString());
    }

  }
  Future uploadImage(File _image) async{
    String url ;
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference ref =  FirebaseStorage.instance.ref().child('Products').child('Products$imgId');
    await ref.putFile(_image);
    url = await ref.getDownloadURL();
    return url;
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded , size: 30 , color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Insert Data", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , fontFamily: "des", color: Colors.black),),

      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  imagePicker().whenComplete(() => uploadImage(_image!));
                },
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,

                  ),
                  child: _image != null ? Image.file(_image!.absolute, fit: BoxFit.cover,) : Center(
                    child: Icon(Icons.image, size: 50,),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                style: TextStyle(fontFamily: "k2", fontSize: 20),
                decoration: InputDecoration(
                    hintText: "Input Name products font khmer",
                    hintStyle: TextStyle(fontSize: 16,fontFamily: "des"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: priceController,
                style: TextStyle(fontFamily: "des", fontSize: 20),
                decoration: InputDecoration(
                    hintText: "Input Price Products",
                    hintStyle: TextStyle(fontSize: 16,fontFamily: "des"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  controller: productController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(fontSize: 20,fontFamily: "k2"),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: "Input Product information Khmer",
                    hintStyle: TextStyle(fontSize: 16, fontFamily: "des"),
                  ),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child:  TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(fontSize: 20,fontFamily: "des"),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: "Input Product information English",
                    hintStyle: TextStyle(fontSize: 16, fontFamily: "des"),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async{
                  addData();
                },
                child: Text("Save" ,style: TextStyle(fontFamily:  "title", fontSize: 30),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  fixedSize: Size(150, 60),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }








}
