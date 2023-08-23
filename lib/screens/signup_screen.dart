import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/services/auth.dart';

import '../constant.dart';
import '../widget/custom_logo.dart';
import '../widget/custom_textfield.dart';
import 'login_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class SignupScreen extends StatefulWidget {
  static String id = 'SignupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final _modalProgressHudNsnPlugin = ModalProgressHudNsn();

  late String _email, _password, _name;

  final _auth = Auth();
  bool mode=false;

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
                onclick: (value) {
                  _name = value!;
                },
                hint: 'Enter your name',
                icon: Icons.person,
              ),
              CustomTextfField(
                hint: 'Enter your email',
                icon: Icons.email,
                onclick: (value) {
                  _email = value!;
                },
              ),
              CustomTextfField(
                onclick: (value) {
                  _password = value!;
                },
                hint: 'Enter your password',
                icon: Icons.lock,
              ),
              Builder(
                builder: (context) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 110),
                  child: Material(
                    elevation:8,
                    borderRadius: BorderRadius.circular(34),
                    color: Colors.black,
                    child: Expanded(
                      child: MaterialButton(

                        onPressed: () async {
                          setState(() {
                            mode=true;
                          });
                          if (globalKey.currentState!.validate()) {
                            globalKey.currentState!.save();

                            try {
                              final authResult =
                                  await _auth.signUp(_email, _password);
                              setState(() {
                                mode=false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Center(
                                    child: Text('Successfully SignUP'),
                                  ),
                                ),
                              );
                            }   catch (e) {
                              setState(() {
                                mode=false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Center(
                                    child: Text(
                                      e.toString(),
                                    ),
                                  ),
                                ),
                              );
                            }
                          }
                          setState(() {
                            mode=false;
                          });
                        },
                        child: Expanded(
                          child: Text(
                            'Sign up',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
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
                      'have an accoont ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
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
}
