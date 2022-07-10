import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/Backend/Config.dart';
import 'package:flutter_apps/Main_pages/ErrorAlertDialogue.dart';
import 'package:flutter_apps/Main_pages/HomePage.dart';
import 'package:flutter_apps/Theme/CustomTextFiield.dart';
import 'package:flutter_apps/Main_pages/CreateAcnt.dart';

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'MyTrendz',
            style: TextStyle(color: Colors.pink, fontSize: 25),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black38),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: CustomTextField(
                      controller: emailController,
                      data: Icons.mail,
                      hinttext: "Email",
                      isobscure: false,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: CustomTextField(
                      controller: passwordController,
                      data: Icons.person,
                      hinttext: "Password",
                      isobscure: true,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    textColor: Colors.pink[300],
                    child: Text('Forgot Password'),
                  ),
                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.pinkAccent,
                        child: Text('Login'),
                        onPressed: () {
                          emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty
                              ? loginUser()
                              : showDialog(
                                  context: context,
                                  builder: (c) {
                                    return ErrorAlertDialogue(
                                        Message: "Fill all the fields");
                                  });
                        },
                      )),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Text('New user?'),
                      FlatButton(
                        textColor: Colors.pink[300],
                        child: Text(
                          'Create Account',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateAcnt()));
                          //signup screen
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ))
                ],
              ),
            )));
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void loginUser() async {
    FirebaseUser firebaseUser;
    await _auth
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((authUser) {
      firebaseUser = authUser.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialogue(Message: error.message.toString());
          });
    });
    if (firebaseUser != null) {
      readData(firebaseUser).then((s) {
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c) => MyHomePage());
        Navigator.push(context, route);
      });
    }
  }

  Future readData(FirebaseUser fUser) async {
    Firestore.instance
        .collection("users")
        .document(fUser.uid)
        .get()
        .then((DataSnapshot) async {
      await EcommerceApp.sharedPreferences
          .setString("uid", DataSnapshot.data[EcommerceApp.userUID]);
      await EcommerceApp.sharedPreferences.setString(
          EcommerceApp.userEmail, DataSnapshot.data[EcommerceApp.userEmail]);
      await EcommerceApp.sharedPreferences.setString(
          EcommerceApp.userName, DataSnapshot.data[EcommerceApp.userName]);
      List<String> cartList =
          DataSnapshot.data[EcommerceApp.userCartList].cast<String>();
      await EcommerceApp.sharedPreferences
          .setStringList(EcommerceApp.userCartList, cartList);
    });
  }
}
