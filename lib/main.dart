import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop/firebase_options.dart';
import 'package:shop/screens/add_product.dart';
import 'package:shop/screens/admin_screen.dart';
import 'package:shop/screens/home_screan.dart';
import 'package:shop/screens/login_screen.dart';
import 'package:shop/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        HomeScreen.id:(context)=> HomeScreen(),
        AdminScreen.id:(context)=>AdminScreen(),
        AddProduct.id:(context)=>AddProduct(),
      },
    );
  }
}
