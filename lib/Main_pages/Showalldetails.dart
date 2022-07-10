import 'package:flutter/material.dart';
import 'package:flutter_apps/Backend/Config.dart';
import 'package:flutter_apps/Counters/CartItemCounter.dart';
import 'package:flutter_apps/Main_pages/Bill.dart';
import 'package:flutter_apps/Main_pages/BuyNow.dart';
import 'package:flutter_apps/Main_pages/HomePage.dart';
import 'package:flutter_apps/Main_pages/ItemModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ShowallDetails extends StatelessWidget {
  const ShowallDetails(
      {Key key,
      this.Img,
      this.Name,
      this.Discount,
      this.Mrp,
      // ignore: non_constant_identifier_names
      this.Your_price,
      this.Item_Category,
      // ignore: non_constant_identifier_names
      this.Status,
      this.Description})
      : super(key: key);

  // ignore: non_constant_identifier_names
  final String Img,
      Name,
      Status,
      Discount,
      Mrp,
      Your_price,
      Description,
      Item_Category;
  //final  String Img = Product.ImgPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SecondAppbar(Name: Name),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.network(
                Img,
                width: 280,
                height: 280,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Mrp: "),
                      Text(r"₹",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 20,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(Mrp,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            decoration: TextDecoration.lineThrough,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Your Price",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                      SizedBox(
                        width: 15,
                      ),
                      Text(r"₹",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35)),
                      Text(Your_price,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("You have saved"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(Discount,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.green[400])),
                      Text("%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.green[400])),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(Status,
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.pinkAccent,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BuyNow(
                                  ImgPath: Img,
                                  name: Name,
                                  your_price: Your_price,
                                  category: Item_Category,
                                )));
                      },
                      child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.deepOrange[300], width: 8),
                            color: Colors.orange,
                          ),
                          child: Center(
                              child: Text(
                            "Buy Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )))),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        checkItemInCart(Name, context);
                      },
                      child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey[350], width: 8),
                            color: Colors.grey[300],
                          ),
                          child: Center(
                              child: Text(
                            "Add To Cart",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )))),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Description",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: 20,),),
                  SizedBox(
                    height: 20,
                  ),
                  Text(Description,style: TextStyle(

                    fontSize: 20,),),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void checkItemInCart(String name, BuildContext context) {
    EcommerceApp.sharedPreferences
            .getStringList(EcommerceApp.userCartList)
            .contains(name)
        ? Fluttertoast.showToast(msg: "Item is already in the cart")
        : addItemToCart(name, context);
  }

  addItemToCart(String name, BuildContext context) {
    List tempCartList =
        EcommerceApp.sharedPreferences.getStringList(EcommerceApp.userCartList);

    tempCartList.add(name);

    EcommerceApp.firestore
        .collection(EcommerceApp.collectionUser)
        .document(
            EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID))
        .updateData({
      EcommerceApp.userCartList: tempCartList,
    }).then((v) {
      Fluttertoast.showToast(msg: "Item Added to the cart successfully.");
      EcommerceApp.sharedPreferences
          .setStringList(EcommerceApp.userCartList, tempCartList);
      Provider.of<CartItemCounter>(context, listen: false).displayResult();
    });
  }
}

class SecondAppbar extends StatelessWidget {
  const SecondAppbar({
    Key key,
    @required this.Name,
  }) : super(key: key);

  final String Name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Expanded(
          child: Text(
            Name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,fontFamily: 'ArchitypeRenner-Bold'),
          ),
        )
      ],
    );
  }
}
