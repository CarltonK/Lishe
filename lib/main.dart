//import 'package:fitme_diets/authentication/login.dart';
import 'package:fitme_diets/authentication/login.dart';
import 'package:fitme_diets/authentication/registration.dart';
//import 'package:fitme_diets/screens/base.dart';
//import 'package:fitme_diets/screens/home.dart';
//import 'package:fitme_diets/screens/base.dart';
import 'package:fitme_diets/screens/recipeDetail.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/detail': (context) => RecipeDetail(),
        //Authentication Screens
        '/registration': (context) => Registration(),
      },
      title: 'Lishe',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
