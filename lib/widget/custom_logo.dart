import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_Logo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40,bottom: 40),
      child: Container(
        height: MediaQuery.of(context).size.height * .22,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('images/icons/buy1.png'),
            ),
            SizedBox(height: 10,),
            Positioned(
              bottom: 0,

              child: TypewriterAnimatedTextKit(
                text: ['BUY IT',],
                speed: Duration(milliseconds: 300),
                textStyle: TextStyle(
                     fontFamily: 'PTSansNarrow',
                    color: Colors.black,
                    fontSize: 45,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}