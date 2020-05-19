import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget backGround() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.red[300]],
            stops: [0.8, 1])),
  );
}

Widget progress(double opacity) {
  return AnimatedOpacity(
    opacity: opacity,
    duration: Duration(seconds: 1),
    child: SpinKitHourGlass(color: Colors.red, size: 150),
  );
}
