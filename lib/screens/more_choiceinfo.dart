import 'package:fitme_diets/models/choice_model.dart';
import 'package:fitme_diets/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChoiceInfo extends StatefulWidget {
  final Choice choice;
  ChoiceInfo({this.choice});

  @override
  _ChoiceInfoState createState() => _ChoiceInfoState();
}

class _ChoiceInfoState extends State<ChoiceInfo> {
  final User curUser = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(Icons.arrow_back,
                                  size: 30.0, color: Colors.indigo[900]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Program',
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          widget.choice.name,
                          style: TextStyle(
                              color: Colors.indigo[900], fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Best cuisines based on your program',
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          widget.choice.cuisine,
                          style: TextStyle(
                              color: Colors.indigo[900], fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Minimum calories per meal based on your program',
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          widget.choice.minCalories.toString(),
                          style: TextStyle(
                              color: Colors.indigo[900], fontSize: 30.0, fontWeight: FontWeight.bold,)
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Maximum calories per meal based on your program',
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          widget.choice.maxCalories.toString(),
                          style: TextStyle(
                              color: Colors.indigo[900], fontSize: 30.0, fontWeight: FontWeight.bold,)
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Hero(
                            tag: widget.choice.imageUrl,
                            child: Image(
                              height: 280,
                              width: 280,
                              image: AssetImage(widget.choice.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 60.0,
        width: double.infinity,
        color: Colors.indigo[900],
        child: GestureDetector(
          onTap: () {
            curUser.regChoice = widget.choice.name;
            Navigator.pop(context);
          },
          child: Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'SELECT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
        ),
      ),
    );
  }
}
