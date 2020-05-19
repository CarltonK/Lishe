import 'package:fitme_diets/models/serverResponse.dart' as resp;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeDetail extends StatelessWidget {
  static resp.Result result;

  Widget singledirection(resp.Step step) {
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
      title: Text(step.step, style: GoogleFonts.muli(textStyle: TextStyle())),
    );
  }

  @override
  Widget build(BuildContext context) {
    result = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
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
                colors: [Colors.white, Colors.red[300]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: RichText(
                    text: TextSpan(style: TextStyle(fontSize: 30), children: [
                  TextSpan(
                      text: result.title,
                      style: TextStyle(color: Colors.black45)),
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
                                    '${result.cookingMinutes} Minutes',
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
                                    "${result.servings} People",
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
                                    "${result.weightWatcherSmartPoints} Calories",
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
                        child: Image(image: NetworkImage(result.image)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
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
                          children: result.analyzedInstructions[0].steps
                              .map((step) => singledirection(step))
                              .toList(),
                        ))
                      ]),
                ),
              ),
              // Container(
              //   height: 400,
              //   width: MediaQuery.of(context).size.width,
              //   padding: EdgeInsets.all(20),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: result.winePairing.productMatches.map((wine) {
              //       return Container(
              //           child: Column(
              //         children: [
              //           Text(wine.description),
              //           Image(
              //             image: NetworkImage(wine.imageUrl),
              //           )
              //         ],
              //       ));
              //     }).toList(),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
