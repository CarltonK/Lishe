import 'package:fitme_diets/screens/base.dart';
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
      },
      title: 'Lishe',
      debugShowCheckedModeBanner: false,
      home: Base(),
    );
  }
}
