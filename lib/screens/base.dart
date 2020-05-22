import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fitme_diets/screens/UserProfile.dart';
import 'package:fitme_diets/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  // Page Index Identifier
  int _pageSelected = 0;

  final List<Widget> _pages = [
    Home(),
    Container(
      height: 300,
      color: Colors.blue,
    ),
    Container(
      height: 300,
      color: Colors.yellow,
    ),
    UserProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: _pages[_pageSelected],
      ),
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _pageSelected,
          items: [
            BottomNavyBarItem(
                icon: Icon(CupertinoIcons.home),
                textAlign: TextAlign.center,
                title: Text('Home'),
                activeColor: Colors.blue,
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                icon: Icon(CupertinoIcons.heart),
                textAlign: TextAlign.center,
                title: Text('Likes'),
                activeColor: Colors.blue,
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                icon: Icon(CupertinoIcons.search),
                textAlign: TextAlign.center,
                title: Text('Search'),
                activeColor: Colors.blue,
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                icon: Icon(CupertinoIcons.person),
                textAlign: TextAlign.center,
                title: Text('Profile'),
                activeColor: Colors.blue,
                inactiveColor: Colors.black),
          ],
          onItemSelected: (int index) {
            setState(() {
              _pageSelected = index;
            });
          }),
    );
  }
}
