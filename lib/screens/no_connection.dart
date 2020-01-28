import 'package:fitme_diets/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Colors.indigo[900],
                Colors.indigo[900],
                Colors.indigo[900],
                Colors.indigo[900],
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
            child: Column(
              children: <Widget>[
                Center(
                  child: Image(
                    image: AssetImage(
                      'assets/no_con.png',
                    ),
                    height: 300.0,
                    width: 300.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'NO INTERNET CONNECTION',
                  style: kTitleStyle,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Make sure your WiFi or Data is turned on\nand then try again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    letterSpacing: .5,
                    fontSize: 20.0,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 70.0,
        width: double.infinity,
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            print('TRIED AGAIN');
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'TRY AGAIN',
                style: TextStyle(
                  color: Color(0xFF5B16D0),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
