import 'package:fitme_diets/screens/home.dart';
import 'package:fitme_diets/screens/no_connection.dart';
import 'package:fitme_diets/screens/onboarding_screen.dart';
import 'package:fitme_diets/screens/recipe_info.dart';
import 'package:fitme_diets/screens/registration.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/nonet': (context) => NoConnection(),
        '/register': (context) => Registration(),
        '/homepage': (context) => HomePage(),
        '/viewinfo': (context) => RecipeInfo()

      },
      title: 'Lishe',
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
