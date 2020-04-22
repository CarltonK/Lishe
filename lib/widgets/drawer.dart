import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 250,
            child: _createHeader()),
            _createDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () => print('Take me home')
            ),
            _createDrawerItem(
              icon: Icons.fastfood,
              text: 'Meal plans',
              onTap: () => Navigator.of(context).pushNamed('/mealplan')
            ),
          ListTile(
            title: Text(
              'Version',
              style: TextStyle(
                color: Colors.indigo[900]
              ),),
            subtitle: Text(
              '1.0.0',
              style: TextStyle(
                color: Colors.indigo[900]
              ),),
            onTap: () => print('This is the app version'),
          )
        ],
      ),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
          'https://images.unsplash.com/photo-1512058454905-6b841e7ad132?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=986&q=80')
      )
    ),
    child: Stack(
      children: <Widget>[
        Positioned(
          bottom: 10,
          left: 10,
          child: Text(
            'Lishe',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5
            ),),
        )
      ],
    ),
  );
}

Widget _createDrawerItem({IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon,color: Colors.indigo[900],),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.indigo[900],
              fontWeight: FontWeight.w500
            ),),
        )
      ],
    ),
    onTap: onTap,
  );
}