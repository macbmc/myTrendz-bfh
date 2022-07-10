import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/Main_pages/Showalldetails.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key key,
    this.category,
  }) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    print(category);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyTrendz',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black38),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      return _Category(
                          ImgPath: model['image'],
                          name: model['name'],
                          mrp: model['mrp'].toString(),
                          discount: model['discount'].toString(),
                          your_price: model['your_price'].toString(),
                          long_description: model['long_description'],
                          cat: model['category'],
                          status: model['status'],
                          Cates: category);
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Category extends Categories {
  const _Category(
      {Key key,
      this.ImgPath,
      this.name,
      this.discount,
      this.mrp,
      this.your_price,
      this.long_description,
      this.cat,
      this.Cates,
      this.status})
      : super(key: key);
  final String ImgPath, name, cat, Cates;
  final String mrp, discount, status, long_description;
  // ignore: non_constant_identifier_names
  final String your_price;

  @override
  Widget build(BuildContext context) {
    if (Cates == null || cat == null) {
      print("error");
      return Container(
        width: 0,
        height: 0,
      );
    }

    if (Cates == cat) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
        child: Stack(children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShowallDetails(
                        Img: ImgPath,
                        Name: name,
                        Discount: discount,
                        Mrp: mrp,
                        Your_price: your_price,
                        Item_Category: cat,
                        Status: status,
                        Description: long_description,
                      )));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Image.network(
                    ImgPath,
                    width: 160,
                    height: 160,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ListView(children: [
                          Text(
                            name,
                            style: Theme.of(context).textTheme.headline3.merge(
                                TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black)),
                          ),
                        ])),
                        Row(
                          children: [
                            Text(r"₹"),
                            Text(
                              mrp,
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              your_price.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "You have saved ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              discount,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "%",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      );
    } else {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }
}
