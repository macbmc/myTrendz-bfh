import 'dart:io';

import 'package:flutter_apps/Main_pages/ErrorAlertDialogue.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/Main_pages/HomePage.dart';
import 'package:flutter_apps/Theme/CustomTextFiield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_apps/Backend/Config.dart';

class CreateAcnt extends StatefulWidget {
  @override
  _CreateAcntState createState() => _CreateAcntState();
}

class _CreateAcntState extends State<CreateAcnt> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController cpasswordController = new TextEditingController();
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Create Account",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomTextField(
                    controller: nameController,
                    data: Icons.person,
                    hinttext: "Name",
                    isobscure: false,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomTextField(
                    controller: emailController,
                    data: Icons.email,
                    hinttext: "Email",
                    isobscure: false,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomTextField(
                    controller: passwordController,
                    data: Icons.person,
                    hinttext: "Password",
                    isobscure: true,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomTextField(
                    controller: cpasswordController,
                    data: Icons.person,
                    hinttext: "Confirm Password",
                    isobscure: true,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.pinkAccent,
                      child: Text('Create Account'),
                      onPressed: () {
                        uploadAndSave();
                      },
                    )),
              ],
            )),
      ),
    );
  }

  Future<void> uploadAndSave() async {
    if (passwordController.text.isNotEmpty) {
      passwordController.text == cpasswordController.text
          ? nameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty &&
                  cpasswordController.text.isNotEmpty
              ? uploadStorage()
              : DisplayDialogue("Please fill all the fields")
          : DisplayDialogue("Please fill all the fields");
    } else {
      DisplayDialogue("Password miss match found");
    }
  }

  DisplayDialogue(String Msg) {
    showDialog(
        context: context,
        builder: (c) {
          return ErrorAlertDialogue(Message: Msg);
        });
  }

  uploadStorage() async {
    _registerUser();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void _registerUser() async {
    FirebaseUser firebaseUser;
    final authuser = await _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialogue(Message: error.message.toString());
          });
    });
    final user = await _auth.currentUser;
    firebaseUser = authuser.user;
    print(user);
    if (user != null) {
      saveUserInfoToFireStore(firebaseUser).then((value) {
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c) => MyHomePage());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Future saveUserInfoToFireStore(FirebaseUser fUser) async {
    Firestore.instance.collection("users").document(fUser.uid).setData({
      "uid": fUser.uid,
      "email": fUser.email,
      "name": nameController.text.trim(),
      EcommerceApp.userCartList: ["garbageValue"],
      EcommerceApp.userOrderList: ["garbageValue"]
    });
    await EcommerceApp.sharedPreferences.setString("uid", fUser.uid);
    await EcommerceApp.sharedPreferences
        .setString(EcommerceApp.userEmail, fUser.email);
    await EcommerceApp.sharedPreferences
        .setString(EcommerceApp.userName, nameController.text);
    await EcommerceApp.sharedPreferences
        .setStringList(EcommerceApp.userCartList, ["garbageValue"]);
    await EcommerceApp.sharedPreferences
        .setStringList(EcommerceApp.userOrderList, ["garbageValue"]);
  }
}
