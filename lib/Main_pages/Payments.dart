import 'package:flutter/material.dart';
import 'package:flutter_apps/Main_pages/Delivery.dart';

class Payments extends StatelessWidget {
  // ignore: non_constant_identifier_names
  double Sum = 1000.00;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white60,
          appBar: AppBar(
            centerTitle: true,
            leading: Icon(Icons.ac_unit),
            title: Text(
              "Payment",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
            backgroundColor: Colors.black12,
            actions: [
              PopupMenuButton(
                color: Colors.white,
                onSelected: _select,
                itemBuilder: (BuildContext context) {
                  return {'Home', 'Order', 'FAQ'}.map((String choice) {
                    return PopupMenuItem(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 90,
                    ),
                    Text(
                      "Quick",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(" Pay",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      width: 200,
                    ),
                    RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.deepOrange, width: 2)),
                      onPressed: () {
                        print("Button pressed");
                      },
                      child: Text(
                        "Add Card",
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Image.asset("assets/visas.jpg"),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 40,
                    ),
                    Icon(Icons.all_out),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Delivery()));
                      },
                      child: Text(
                        "Pay with Debit/Card card",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Icon(Icons.all_out),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Delivery()));
                      },
                      child: Text(
                        "Cash on Delivery",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  width: 300,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                // Row(
                //children: [
                // SizedBox(
                //    height: 60,
                //     width: 20,
                //  ),
                //   Text("Total amount to be paid :",style: TextStyle(fontSize: 20,),),
                //  Text(" ₹ ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                // ],
                // ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Thank You for Shopping with Us",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ));
  }

  void _select(value) {
    switch (value) {
      case 'Home':
        break;
      case 'Order':
        break;
      case 'FAQ':
        break;
    }
    print(value);
  }
}
