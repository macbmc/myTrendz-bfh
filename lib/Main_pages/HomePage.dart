import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/Main_pages/Categories.dart';
//import 'package:flutter_apps/Main_pages/MyCart.dart';
import 'package:flutter_apps/Main_pages/MyProfile.dart';
import 'package:flutter_apps/Main_pages/Sample.dart';
import 'package:flutter_apps/Main_pages/Showalldetails.dart';
import 'package:flutter_apps/Theme/CustomAppbar.dart';
import 'package:flutter_apps/Theme/TextTheme.dart';
import 'package:flutter_apps/Main_pages/login.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_apps/Main_pages/SearchBox.dart';
import 'package:flutter_apps/Main_pages/ItemModel.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: non_constant_identifier_names
  void OnpressedEvent(BuildContext context) {
    Navigator.of(context).pushNamed('/Showalldetails');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyTrendz',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.black38),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink[300],
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector( onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
            },
                child: new Icon(Icons.home,color: Colors.white,)),
            title: GestureDetector( onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
            },
                child: new Text('Home',style: SmallGery,)),
          ),
          BottomNavigationBarItem(
            icon: GestureDetector( onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartItems()));
            },
                child: new Icon(Icons.shopping_cart_outlined,color: Colors.white,)),
            title: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartItems()));
                },
                child: new Text('Cart',style: SmallGery,)),
          ),
          BottomNavigationBarItem(

              icon: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile()));
                  },
                  child: Icon(Icons.person,color: Colors.white,)),
              title: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile()));
                  },
                  child: Text('Profile',style: SmallGery,))

          )
        ],
      ),
         
      body: SingleChildScrollView(
        child: Container(
          color: Colors.pink[50],
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text("Trendings..",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Colors.red)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    OfferZone(
                                      ImgPath: "assets/image1.jpg",
                                        matter: "Ladies Wear"
                                    ),
                                    OfferZone(
                                      ImgPath: "assets/image2.jpg",
                                        matter: "Ladies Wear"
                                    ),
                                    OfferZone(
                                      ImgPath: "assets/image1.jpg",
                                        matter: "Ladies Wear"
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SafeArea(
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          RoundBox(
                              ImgPath: "assets/image3.jpeg",
                              matter: "Mens Wear"),
                          RoundBox(
                              ImgPath: "assets/image4.jpg",
                              matter: "Kids Wear"),
                          RoundBox(
                              ImgPath: "assets/image5.jpeg",
                              matter: "Ladies Wear"),
                          RoundBox(
                              ImgPath: "assets/image6.jpg",
                              matter: "Mens Footwear"),
                          RoundBox(
                              ImgPath: "assets/women.jpg",
                              matter: "Womans Footwear"),
                          RoundBox(
                              ImgPath: "assets/image7.jpg", matter: "Handbag"),
                          RoundBox(
                              ImgPath: "assets/image8.jpg",
                              matter: "Accessories"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
                      return Product(
                        ImgPath: model['image'],
                        name: model['name'],
                        mrp: model['mrp'].toString(),
                        discount: model['discount'].toString(),
                        your_price: model['your_price'].toString(),
                        long_description: model['long_description'],
                        cat: model['category'],
                        status: model['status'],
                      );
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

circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 12),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
    ),
  );
}

class RoundBox extends StatelessWidget {
  final String ImgPath;
  final String matter;
  const RoundBox({Key key, this.ImgPath, this.matter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Categories(
                  category: matter,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  image: DecorationImage(image: AssetImage(ImgPath))),
            ),
            Text(
              matter,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,fontFamily: 'ArchitypeRenner-Bold'),
            ),
          ],
        ),
      ),
    );
  }
}

class OfferZone extends StatelessWidget {
  final String ImgPath,matter;
  const OfferZone({Key key, this.ImgPath,this.matter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Categories(
                    category: matter,
                  )));
            },
            child: Image.asset(ImgPath)),
      ),
    );
  }
}

class GreyBox extends StatelessWidget {
  final String title;

  const GreyBox({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(fontSize: 17),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.black12,
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product(
      {Key key,
      this.ImgPath,
      this.name,
      this.discount,
      this.mrp,
      this.your_price,
      this.cat,
      this.long_description,
      this.status})
      : super(key: key);
  final String ImgPath, name, cat;
  final String mrp, discount, your_price, status, long_description;

  @override
  Widget build(BuildContext context) {
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
                      Status: status,
                      Item_Category: cat,
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
                            your_price,
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
  }
}
