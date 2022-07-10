import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/Backend/Config.dart';
import 'package:flutter_apps/Counters/AddressChanger.dart';
import 'package:flutter_apps/Counters/CartItemCounter.dart';
import 'package:flutter_apps/Counters/ItemQuantity.dart';
import 'package:flutter_apps/Counters/TotalAmt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'Main_pages/HomePage.dart';
import 'Main_pages/Showalldetails.dart';
import 'Main_pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EcommerceApp.auth = FirebaseAuth.instance;
  EcommerceApp.sharedPreferences = await SharedPreferences.getInstance();
  EcommerceApp.firestore = Firestore.instance;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (c) => CartItemCounter()),
          ChangeNotifierProvider(create: (c) => ItemQuantity()),
          ChangeNotifierProvider(create: (c) => AddressChanger()),
          ChangeNotifierProvider(create: (c) => TotalAmount()),
        ],
        child: MaterialApp(
          routes: {'/Showalldetails': (context) => ShowallDetails()},
          home: Scaffold(
            body: LoginApp()
          ) ));
  }
}
