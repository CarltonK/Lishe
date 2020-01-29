import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecipeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Map _data = ModalRoute.of(context).settings.arguments;
    var people = _data['servings'];
    var time = _data['readyInMinutes'];
    var title = _data['title'];
    int calories = _data['nutrition'][0]['amount'].toInt();
    String image = _data['image'];
    List<dynamic> steps = _data['analyzedInstructions'][0]['steps'];
    bool isLiked = false;
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        elevation: 0.0,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white
          ),),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                
              },
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,),
            )
          ],
      ),
      backgroundColor: Colors.indigo[900],
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.indigo[800],
                  borderRadius: BorderRadius.circular(20)),
              height: 200,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10,),
                            Text(
                              '$time MINUTES     ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                       Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10,),
                            Text(
                              '$people PEOPLE        ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                     Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.receipt,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10,),
                            Text(
                              '$calories CALORIES',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Hero(
                      tag: image,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16)
                        ),
                        child: Image.network(
                          image,
                          fit: BoxFit.contain,),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
               margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.indigo[800],
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 20
                    ),
                    child: Text(
                      'Wine Pairing',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: 22
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text(
                      _data['winePairing']['pairingText'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        wordSpacing: 1.0,
                        letterSpacing: .5,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 45),
              child: Text(
                'Directions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  letterSpacing: 0.5
                ),),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
        color: Colors.white,
      ),
                  itemCount: steps.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.white
                        ),
                      ),
                      title: Text(
                        steps[index]['step'],
                        style: TextStyle(
                          color: Colors.white,
                          wordSpacing: 1.0,
                          letterSpacing: .5,
                          fontSize: 15
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
