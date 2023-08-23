import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop/constant.dart';
import 'package:shop/widget/custom_button.dart';
import 'package:shop/services/store.dart';

import '../models/product.dart';
import '../widget/custom_textfield.dart';

class AddProduct extends StatefulWidget {
  static String id = 'AddProduct';

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
   String _name='', _price='', _description='', _category='', _location='';

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  void collectData() {
    setState(() {
      CollectionReference collRef =
          FirebaseFirestore.instance.collection('product');
      collRef.add({
        '_name': _name,
        '_price': _price,
        '_description': _description,
        '_category': _category,
        '_location': _location,
      });
    });
  }

  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CustomTextfField(
                  onclick: (value) {
                    _name = value!;
                  },
                  hint: 'Product Name',
                  icon: Icons.drive_file_rename_outline),
              CustomTextfField(
                  onclick: (value) {
                    _price = value!;
                  },
                  hint: 'Product Price',
                  icon: Icons.price_change),
              CustomTextfField(
                  onclick: (value) {
                    _description = value!;
                  },
                  hint: 'Product Description',
                  icon: Icons.description_outlined),
              CustomTextfField(
                  onclick: (value) {
                    _category = value!;
                  },
                  hint: 'Product Category',
                  icon: Icons.category),
              CustomTextfField(
                  onclick: (value) {
                    _location = value!;
                  },
                  hint: 'Product Location',
                  icon: Icons.location_on_sharp),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: RoundButtom(
                    titil: 'Add Product',
                    onpressed: () async {
                      if (_globalKey.currentState!.validate()) {
                        _globalKey.currentState!.save();
                      /*  CollectionReference usersCollection = FirebaseFirestore.instance.collection('product');
                         usersCollection.doc('product').set({
                          'name': _name,
                          'price': _price,
                          'description': _description,
                          'category': _category,
                          'location': _location,

                        });*/
                        try {
                          await _store.addProduct(
                            Product(
                              p_name: _name,
                              p_price: _price,
                              p_description: _description,
                              p_category: _category,
                              p_location: _location,
                            ),
                          );
                          print('Product added successfully');
                        } catch (e) {
                          print('Error adding product: $e');
                        }

                        //collectData();
                        //_globalKey.currentState?.reset();
                      }
                    },
                    colur: KAdminButtom),
              )
            ],
          ),
        ),
      ),
    );
  }
}
