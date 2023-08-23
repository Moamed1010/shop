import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop/constant.dart';

import '../models/product.dart';
class Store{
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;
  addProduct(Product product ){
  _firestore.collection(KProdcutCollection).add(
    {
      KProdcutName:product.p_name,
      KProdcutPrice:product.p_price,
      KProdcutDescription:product.p_description,
      KProdcutCategory:product.p_category,
      KProdcutLocation:product.p_location,

    }
  );
  }
}