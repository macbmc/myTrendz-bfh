import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/Backend/Config.dart';
import 'package:flutter_apps/Main_pages/ErrorAlertDialogue.dart';
import 'package:flutter_apps/Main_pages/HomePage.dart';
import 'package:flutter_apps/Main_pages/Sample.dart';

import '../Backend/Config.dart';
import 'login.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyTrendz',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black38),
      ),
      body: ListView(
        children: [
          SafeArea(
            minimum: EdgeInsets.all(5),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink[300]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Hello..",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        EcommerceApp.sharedPreferences
                            .getString(EcommerceApp.userName),
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Divider(
                          height: 10,
                          color: Colors.white,
                          thickness: 10,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onTap: () {
                            print("Pressed");
                          },
                        ),
                        Divider(
                          height: 10,
                          color: Colors.white,
                          thickness: 6,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            "My Cart",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartItems()));
                          },
                        ),
                        Divider(
                          height: 10,
                          color: Colors.white,
                          thickness: 6,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            "My orders",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onTap: () {
                            print("Pressed");
                          },
                        ),
                        Divider(
                          height: 10,
                          color: Colors.white,
                          thickness: 6,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            "LogOut",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onTap: () {
                            print("Pressed");
                            EcommerceApp.auth.signOut().then((c) {
                              Route route =
                                  MaterialPageRoute(builder: (c) => LoginApp());
                              Navigator.pushReplacement(context, route);
                            });
                          },
                        ),
                        Divider(
                          height: 10,
                          color: Colors.white,
                          thickness: 6,
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Text(
                          "Developed by Team Elixer",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
