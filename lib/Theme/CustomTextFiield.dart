import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final controller, hinttext, data;
  bool isobscure = true;
  CustomTextField(
      {Key key, this.controller, this.data, this.hinttext, this.isobscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isobscure,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(data, color: Colors.pink[300]),
        hintText: hinttext,
      ),
    );
  }
}
