import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButtom extends StatelessWidget {

  var titil;
  late void Function() onpressed;
  var colur ;
  RoundButtom({required this.titil,required this.onpressed,required this.colur});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: colur,
        child: MaterialButton(
          onPressed: onpressed,
          minWidth: 200,
          height: 45,
          child: (Text(titil)),
        ),
      ),
    );
  }
}
