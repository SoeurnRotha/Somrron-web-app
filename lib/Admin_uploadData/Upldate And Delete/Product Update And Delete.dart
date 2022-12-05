import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';



class Update_And_Delete extends StatefulWidget {
  const Update_And_Delete({Key? key}) : super(key: key);

  @override
  State<Update_And_Delete> createState() => _Update_And_DeleteState();
}

class _Update_And_DeleteState extends State<Update_And_Delete> {
  final productController = TextEditingController();
  final descriptionController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  File? _image;
  final picker = ImagePicker();
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
    Reference ref =  FirebaseStorage.instance.ref().child('Products').child('Products $imgId');
    await ref.putFile(_image);
    url = await ref.getDownloadURL();
    return url;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: _buildBody,
    );
  }
  get _buildAppbar {
    return AppBar(
      title: Text("Update product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1", color: Colors.black),),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded , size: 30, color: Colors.black,),
        onPressed: ()=> Navigator.pop(context),
      ),

    );
  }
  get _buildBody{
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Products").snapshots(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Center(child: Text("Error"),);
        }else if(snapshot.hasData){
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context , index){
              final data = snapshot.data!.docs[index];
              return Container(
                child: GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewInformation_Page(imageProduct: data['image'],nameProduct: data['name'],priceProduct: data['price'],productInfo: data['proInfo'],desInfo: data['desInfo'],)));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    height: 700,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(data['img']),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 10,),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child:  Text("${data['name']}", style: TextStyle(fontFamily: "des",fontWeight: FontWeight.bold,fontSize: 18),),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child:  Text("${data['price']}", style: TextStyle(fontFamily: "des",fontWeight: FontWeight.bold,fontSize: 18),),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Text("${data['proInfo']}",style: TextStyle(fontFamily: "k2",fontSize: 16),),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Text("${data['desInfo']}",style: TextStyle(fontFamily: "des",fontSize: 16),),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    showDialog(context: context, builder: (_){
                                      return Dialog(
                                        child: ListView(
                                          physics: BouncingScrollPhysics(),
                                          children: [
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
                                                    child: Icon(Icons.image, size: 60,),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: TextField(
                                                controller: nameController,
                                                style: TextStyle(fontFamily: "k2", fontSize: 16),
                                                decoration: InputDecoration(
                                                    hintText: "Input Name products",
                                                    hintStyle: TextStyle(fontSize: 16,fontFamily: "des"),
                                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: TextField(
                                                controller: priceController,
                                                style: TextStyle(fontFamily: "des", fontSize: 16),
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
                                                  style: TextStyle(fontSize: 16,fontFamily: "k2"),
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                    hintText: "Input Product information khmer",
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
                                                  style: TextStyle(fontSize: 16,fontFamily: "des"),
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                    hintText: "Input Description information font English",
                                                    hintStyle: TextStyle(fontSize: 16, fontFamily: "des"),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                onPressed: () async{
                                                  final imageURL = await uploadImage(_image!);
                                                  FirebaseFirestore.instance.collection("Products").doc(data.id).update({
                                                    'img' : imageURL,
                                                    'name' : nameController.text.trim(),
                                                    'price' : priceController.text,
                                                    'proInfo' : productController.text,
                                                    'desInfo' :descriptionController.text
                                                  }).whenComplete(() => ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                      SnackBar(
                                                          content: Text("You Update product successful")
                                                      )));
                                                },
                                                child: Text("Update" ,style: TextStyle(fontWeight: FontWeight.bold ,fontFamily:  "des", fontSize: 30),),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.yellow,
                                                  fixedSize: Size(150, 60),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                onPressed: () async{
                                                  FirebaseFirestore.instance.collection("Products")
                                                      .doc(data.id)
                                                      .delete().whenComplete(() => ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                      SnackBar(
                                                          content: Text("You Delete product successful")
                                                      )));
                                                },
                                                child: Text("Delete" ,style: TextStyle(fontWeight: FontWeight.bold ,fontFamily:  "des", fontSize: 30),),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.red,
                                                  fixedSize: Size(150, 60),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                  child: Text("Edit", style: TextStyle(fontFamily: "title", fontWeight: FontWeight.bold,fontSize: 25),),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.lightGreenAccent,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      fixedSize: Size(150, 40)
                                  ),
                                )
                              ],
                            )
                        ),

                        SizedBox(height: 10,),



                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

}

