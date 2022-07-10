import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/Main_pages/Delivery.dart';

class BillApp extends StatelessWidget {
  const BillApp({Key key, this.item, this.total}) : super(key: key);

  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  final int total;
  final String item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 10),
          color: Colors.white,
          child: Column(
            children: [
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
                  SizedBox(
                    width: 30,
                  ),
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
                children: [Text("Number of Products:")],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 30,
                        ),
                        Text(
                          "Total Amount - ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Text(
                          total.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row TextBlockOrd(String prod, int quant, String amt) {
    return Row(
      children: [
        SizedBox(
          width: 35,
        ),
        Text(
          "prod",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          width: 110,
        ),
        Text(
          "$quant",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          width: 110,
        ),
        Text(
          "$amt",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
