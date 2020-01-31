import 'dart:math';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:fitme_diets/models/responseParse.dart';
import 'package:fitme_diets/utilities/api.dart';
import 'package:fitme_diets/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _HomePageState extends State<HomePage> {
  static API api = API();

  static var images = 3;
  var currentPage = images - 1.0;
  var padding = 20.0;
  var verticalInset = 20.0;
  int index;

  Future<ServerResponse> serverResponse;

  @override
  void initState() {
    super.initState();
    serverResponse = api.getWeightLossDiet();
  }

  @override
  Widget build(BuildContext context) {
    //var _userCurrent = ModalRoute.of(context).settings.arguments;
    //print(_userCurrent);
    PageController controller = PageController(initialPage: images - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
        index = currentPage.toInt();
      });
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              print('Search Icon Pressed');
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.indigo[900],
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePickerTimeline(
                    DateTime.now(),
                    onDateChange: (date) {
                      print(date.day.toString());
                    },
                    daysCount: 30,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Welcome back',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Here are Today\'s meals',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: FutureBuilder<ServerResponse>(
                  future: serverResponse,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GestureDetector(
                        onTap: () {
                          var data = snapshot.data.results[index].toJson();
                          //print(data);
                          Navigator.pushNamed(context, '/viewinfo',
                              arguments: data);
                        },
                        child: Stack(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: widgetAspectRatio,
                              child:
                                  LayoutBuilder(builder: (context, contraints) {
                                var width = contraints.maxWidth;
                                var height = contraints.maxHeight;

                                var safeWidth = width - 2 * padding;
                                var safeHeight = height - 3 * padding;

                                var heightOfPrimaryCard = safeHeight;
                                var widthOfPrimaryCard =
                                    heightOfPrimaryCard * cardAspectRatio;

                                var primaryCardLeft =
                                    safeWidth - widthOfPrimaryCard;
                                var horizontalInset = primaryCardLeft / 2;

                                List<Widget> cardList = new List();

                                for (var i = 0; i < snapshot.data.number; i++) {
                                  var delta = i - currentPage;
                                  bool isOnRight = delta > 0;

                                  var start = padding +
                                      max(
                                          primaryCardLeft -
                                              horizontalInset *
                                                  -delta *
                                                  (isOnRight ? 15 : 1),
                                          0.0);

                                  var cardItem = Positioned.directional(
                                    top: padding +
                                        verticalInset * max(-delta, 0.0),
                                    bottom: padding +
                                        verticalInset * max(-delta, 0.0),
                                    start: start,
                                    textDirection: TextDirection.rtl,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(3.0, 6.0),
                                                  blurRadius: 10.0)
                                            ]),
                                        child: AspectRatio(
                                          aspectRatio: cardAspectRatio,
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: <Widget>[
                                              Hero(
                                                tag: snapshot
                                                    .data.results[i].image,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  child: Image.network(
                                                      snapshot.data.results[i]
                                                          .image,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16.0,
                                                              vertical: 8.0),
                                                      child: Text(
                                                          snapshot.data
                                                              .results[i].title,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 25.0,
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 12.0,
                                                              bottom: 12.0),
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    22.0,
                                                                vertical: 6.0),
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .blueAccent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0)),
                                                        child: Text("Read",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                  cardList.add(cardItem);
                                }
                                return Stack(
                                  children: cardList,
                                );
                              }),
                            ),
                            Positioned.fill(
                              child: PageView.builder(
                                controller: controller,
                                reverse: true,
                                itemCount: snapshot.data.number,
                                itemBuilder: (context, index) {
                                  return Container();
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {}

                    return Center(
                      child: SpinKitRipple(
                        size: 200,
                        color: Colors.white,
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
