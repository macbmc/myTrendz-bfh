import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/Backend/Config.dart';

class Mycart extends StatefulWidget {
  @override
  _MycartState createState() => _MycartState();
}

var myCart =
    EcommerceApp.sharedPreferences.getStringList(EcommerceApp.userCartList);
int item = EcommerceApp.sharedPreferences
    .getStringList(EcommerceApp.userCartList)
    .length;

class _MycartState extends State<Mycart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            StreamBuilder(
              stream: Firestore.instance.collection("items").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Text("No data");
                }
                return ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: snapshot.data.documents.map((model) {
                    return CartItem(
                      ImgPath: model['image'],
                      name: model['name'],
                      mrp: model['mrp'].toString(),
                      discount: model['discount'].toString(),
                      your_price: model['your_price'].toString(),
                      long_description: model['long_description'],
                      status: model['status'],
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem(
      {Key key,
      this.ImgPath,
      this.name,
      this.discount,
      this.mrp,
      this.your_price,
      this.long_description,
      this.status})
      : super(key: key);
  final String ImgPath, name;
  final String mrp, discount, your_price, status, long_description;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SearchService {
  SearchByName(String Cart) {
    return Firestore.instance
        .collection('items')
        .where('name', isEqualTo: Cart)
        .getDocuments();
  }
}
