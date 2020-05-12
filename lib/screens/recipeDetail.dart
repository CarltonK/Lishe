import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  Widget singledirection() {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 3,
            backgroundColor: Colors.orange,
          ),
        ],
      ),
      title: Text("Lorem Ipsum"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: null),
          IconButton(
              icon: Icon(Icons.menu, color: Colors.white), onPressed: null)
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueGrey[50], Colors.blueGrey[50]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: RichText(
                  text: TextSpan(style: TextStyle(fontSize: 30), children: [
                TextSpan(
                    text: 'Grilled', style: TextStyle(color: Colors.black45)),
                TextSpan(
                    text: ' Salmon',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54))
              ])),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.timer,
                                  color: Colors.orange,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "32 minutes",
                                  style: TextStyle(color: Colors.orange),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.person,
                                  color: Colors.orange,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "2 People",
                                  style: TextStyle(color: Colors.orange),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.invert_colors,
                                  color: Colors.orange,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "23 Calories",
                                  style: TextStyle(color: Colors.orange),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Directions",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                            child: ListView(
                          children: <Widget>[
                            singledirection(),
                            singledirection(),
                            singledirection(),
                          ],
                        ))
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
