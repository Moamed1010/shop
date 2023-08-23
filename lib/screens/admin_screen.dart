import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/constant.dart';
import 'package:shop/screens/add_product.dart';
import 'package:shop/widget/custom_button.dart';

class AdminScreen extends StatefulWidget {
  static String id = 'AdminScreen';

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KMainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            RoundButtom(
                titil: 'Add Prouduct',
                onpressed: () {
                  Navigator.pushNamed(context, AddProduct.id);
                },
                colur: KAdminButtom),
            RoundButtom(
                titil: 'Edit Prouduct', onpressed: () {}, colur: KAdminButtom),
            RoundButtom(
                titil: 'View Order', onpressed: () {}, colur: KAdminButtom),
          ],
        ));
  }
}
