import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samrron/Helper/ProductHelper.dart';
import 'package:samrron/Model/ProductModel.dart';

import '../Detail_Page/Product_detail.dart';

class ListProduct_Web extends StatefulWidget {
  const ListProduct_Web({Key? key}) : super(key: key);

  @override
  State<ListProduct_Web> createState() => _ListProduct_WebState();
}

class _ListProduct_WebState extends State<ListProduct_Web> {

  ProductHelper _productHelper = ProductHelper();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 650,
        child: StreamBuilder<QuerySnapshot>(
          stream: _productHelper.read(),
          builder: (context , snapshot){
            if(snapshot.hasError){
              return Text("Error");
            }else if(snapshot.hasData){
              return buildListView(snapshot.data!.docs);
            }else{
              return Center(child: CircularProgressIndicator ());
            }
          },
        )
    );
  }

  Widget buildListView(List<DocumentSnapshot> doc){
    List<ProductModel> productList = doc.map((data) => ProductModel.fromSnapshot(data)).toList();
    return ListView.builder(
      scrollDirection: Axis.horizontal,

      itemCount: productList.length,
      itemBuilder: (context , index){
        return buildRow(productList[index]);
      },
    );
  }

  Widget buildRow(ProductModel items){
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailProduct(
            image: items.image,
            name: items.name,
            proInfo: items.proInfo,
            price: items.price,
            desInfo: items.desInfo,

          )));
        },
        child: Container(
          width: 300,
          height: 450,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            boxShadow: [

              BoxShadow(
                offset: Offset(7,8),
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 2
              )
            ]
          ),
          child: Column(
            children: [
              _boxImage(items.image),
              _text(items.name,items.proInfo,items.price,items.desInfo),
            ],
          ),
        ),
      ),
    );
  }

  Widget _boxImage(String img){
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
            ),
            image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover
            )
        ),
      ),

    );
  }

  Widget _text(String name,String proInfo,String price,String desInfo){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text(name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "k2"),maxLines: 1,overflow: TextOverflow.ellipsis,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 280,
            child: Text(proInfo,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontFamily: "k2"),maxLines: 2,overflow: TextOverflow.ellipsis,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 280,
            child: Text(desInfo,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontFamily: "des"),maxLines: 2,overflow: TextOverflow.ellipsis,),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: [
                Icon(Icons.star,size: 30,color: Colors.yellow,),
                Icon(Icons.star,size: 30,color: Colors.yellow,),
                Icon(Icons.star,size: 30,color: Colors.yellow,),
                Icon(Icons.star,size: 30,color: Colors.yellow,),
                Icon(Icons.star,size: 30,color: Colors.yellow,),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 200,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepPurple

            ),
            child: Center(
              child: Text("${price} \$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "price"),),
            ),
          ),
        )

      ],
    );
  }
}
