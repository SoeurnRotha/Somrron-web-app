import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/ProductModel.dart';


class ProductHelper{
  Stream<QuerySnapshot <Map<String,dynamic>>> read(){
    return FirebaseFirestore.instance.collection(ProductModel.CollictionName).snapshots();
  }
}