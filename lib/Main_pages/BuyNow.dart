import 'package:flutter/material.dart';
import 'package:flutter_apps/Main_pages/Delivery.dart';

class BuyNow extends StatelessWidget {
  const BuyNow({
    Key key,
    this.ImgPath,
    this.name,
    this.category,
    this.your_price,
  }) : super(key: key);
  final String ImgPath, name, category;

  // ignore: non_constant_identifier_names
  final String your_price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontStyle: FontStyle.italic,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 10,right: 10),
        color: Colors.white,
        child: Column(children: [
          Row(

            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "Delivery Address:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [

              Container(
                width: 300,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Enter the address",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Order Summary :",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Product",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Divider(
                    color: Colors.brown,
                  ),
                  Container(
                      width: 100, height: 100, child: Image.network(ImgPath))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Category",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Divider(
                    color: Colors.brown,
                  ),
                  Text(category,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Price",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Divider(
                    color: Colors.brown,
                  ),
                  Text(your_price,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                ],
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 20,),
              Text(
                "Total Amount - ",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Rs.",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                your_price,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 70,
                width: 150,
              ),
              ButtonTheme(
                minWidth: 90,
                height: 40,
                child: RaisedButton(
                  color: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: Colors.deepOrange, width: 2)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Delivery()));
                  },
                  child: Text(
                    "Confirm",
                    style:
                    TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          )

        ]),
      ),
    );
  }
}
