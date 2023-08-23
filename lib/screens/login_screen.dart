import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/screens/admin_screen.dart';
import 'package:shop/screens/home_screan.dart';
import 'package:shop/screens/signup_screen.dart';
import 'package:shop/services/auth.dart';

import '../constant.dart';
import '../widget/custom_logo.dart';
import '../widget/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;

  final _auth = Auth();
  bool mode = false;
  bool isadmin = false;
  final adminpassword = 'Admin1234';
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      body: ModalProgressHUD(
        inAsyncCall: mode,
        child: Form(
          key: globalKey,
          child: ListView(
            children: <Widget>[
              Custom_Logo(),
              CustomTextfField(
                hint: 'Enter your email',
                icon: Icons.email,
                onclick: (value) {
                  _email = value!;
                },
              ),
              CustomTextfField(
                hint: 'Enter your password',
                icon: Icons.lock,
                onclick: (value) {
                  _password = value!;
                },
              ),
              Builder(
                builder: (context) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 120),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black,
                    child: MaterialButton(
                      onPressed: () async {
                        _validate(context);

                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t  have an accoont ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignupScreen.id);
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isadmin = true;
                          });
                        },
                        child: Text(
                          'i \'m an admin',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: isadmin ? Colors.black : Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isadmin = false;
                          });
                        },
                        child: Text(
                          'i \'m a user',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: isadmin ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _validate(BuildContext context) async {
    setState(() {
      mode = true;
    });
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      if (isadmin == true) {
        if (_password == adminpassword) {
          await _auth.signin(_email, _password);
          setState(() {
            mode = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Center(
                child: Text('Successfully login '),
              ),
            ),
          );
          Navigator.pushNamed(context, AdminScreen.id);
        } else {
          setState(() {
            mode = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Center(
                child: Text('something wont wrong'),
              ),
            ),
          );
        }
      } else {
        try {
          await _auth.signin(_email, _password);
          setState(() {
            mode = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Center(
                child: Text('Successfully login '),
              ),
            ),
          );
          Navigator.pushNamed(context, HomeScreen.id);
        } catch (e) {
          setState(() {
            mode = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Center(
                child: Text('something wont wrong'),
              ),
            ),
          );
        }
      }
    }
    setState(() {
      mode = false;
    });
  }
}
