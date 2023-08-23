import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTextfField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final void Function(String?)? onclick;
  String _errorMessage(String str) {
    switch (hint) {
      case "Enter your name":
        return 'Name is empty!';
      case "Enter your email":
        return 'Email is empty!';
      case "Enter your password":
        return 'Password is empty!';
      default:
        return '';
    }
  }

  CustomTextfField(
      {required this.onclick, required this.hint, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 30),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return _errorMessage(hint);
          }
        },
        onSaved: onclick,
        obscureText: hint == 'Enter your password' ? true : false,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: KTextfeild,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Colors.white,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
