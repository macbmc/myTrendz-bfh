import 'package:flutter/material.dart';
import 'package:flutter_apps/Main_pages/HomePage.dart';

class Delivery extends StatelessWidget {
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
            "MyTrendzz",
            style: TextStyle(
              color: Colors.blueAccent,
              fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 300,
                  ),
                  Container(
                    height: 100,
                    child: Image.asset(
                      "assets/IMG_20210518_203821.jpg",
                      width: 100,
                      height: 200,
                    ),
                  )
                ],
              ),

              Text(
                "Your Order has been placed",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Verification code:",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "LiuhION85YGFujnbYFDswq82",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Thank You,Have a Good Day ",
                style: TextStyle(fontSize: 15, color: Colors.black38),
              ),
              RaisedButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      settings: RouteSettings(name: "MyHomePage"),
                      builder: (context) => MyHomePage(),
                    ),
                  );
                  Navigator.of(context)
                      .popUntil(ModalRoute.withName("MyHomePage"));
                },
                child: Text("Home",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                color: Colors.pink[300],
              )
            ],
          ),
        ),
      ),
    );
  }
}
