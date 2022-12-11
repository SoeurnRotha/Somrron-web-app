import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samrron/Helper/ProductHelper.dart';

import '../Detail_Page/Product_detail.dart';
import '../Model/ProductModel.dart';

class ListProduct_Mobile extends StatefulWidget {
  const ListProduct_Mobile({Key? key}) : super(key: key);

  @override
  State<ListProduct_Mobile> createState() => _ListProduct_MobileState();
}

class _ListProduct_MobileState extends State<ListProduct_Mobile> {

  ProductHelper _productHelper = ProductHelper();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: StreamBuilder<QuerySnapshot>(
        stream: _productHelper.read(),
        builder: (context , snapshot){
          if(snapshot.hasError){
            return Text("Error");
          }else if(snapshot.hasData){
            return _buildList(snapshot.data!.docs);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },

      )
    );
  }

  Widget _buildList(List<DocumentSnapshot> doc){
    List<ProductModel> productList = doc.map((data) => ProductModel.fromSnapshot(data)).toList();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productList.length,
      itemBuilder: (context , index){
        return _buildCol(productList[index]);
      },
    );
  }

  Widget _buildCol(ProductModel items){
    return Padding(
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
          width: 230,
          height: 330,
          decoration: BoxDecoration(
              boxShadow: [

                BoxShadow(
                    offset: Offset(7,8),
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 2
                )
              ],
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10)
            
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _boxImage(items.image),
              _text(items.name , items.proInfo , items.price, items.desInfo),
            ],
          ),
        ),
      ),
    );
}

  Widget _boxImage(String img){
    return Expanded(
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),

            image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover
            )
        ),
      ),
    );
  }

  Widget _text(String name,String proInfo, String price,String desInfo){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text(name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,fontFamily: "k2"),overflow: TextOverflow.ellipsis,maxLines: 1,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(proInfo,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "k2"),maxLines: 2,overflow: TextOverflow.ellipsis,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(desInfo,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "des"),maxLines: 2,overflow: TextOverflow.ellipsis,),
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
            height:  40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepPurple

            ),
            child: Center(
              child: Text("${price} \$",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "price"),),
            ),
          ),
        )

      ],
    );
  }
}
