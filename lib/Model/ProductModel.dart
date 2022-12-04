import 'package:cloud_firestore/cloud_firestore.dart';
class ProductModel{
  static const String CollictionName = "Products";
  static const String Image = "img";
  static const String Name = "name";
  static const String Price = "price";
  static const String ProInfo = "proInfo";
  static const String DesInfo = "desInfo";

  late String image;
  late String name;
  late String price;
  late String proInfo;
  late String desInfo;
  DocumentReference reference;



  ProductModel({this.image="no image", this.name = "no name", this.price= "no price",required this.reference, this.proInfo = "no info",this.desInfo = "no des"});


  ProductModel.fromMap(Object ? object , {required this.reference}){
    Map<String,dynamic>? map = object as Map<String,dynamic>?;
    image = (map ?? {})[Image] ?? "no image";
    name = (map ?? {})[Name] ?? "no name";
    price = (map ?? {})[Price] ?? "no price";

    proInfo = (map ?? {})[ProInfo] ?? "no info";
    desInfo = (map ?? {})[DesInfo] ?? "no info";

  }

  ProductModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);




  Map<String ,dynamic> get toMap => {
    Image: image,
    Name: name,
    Price: price,

    ProInfo: proInfo,
    DesInfo: desInfo,

  };

}