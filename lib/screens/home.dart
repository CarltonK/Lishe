import 'package:fitme_diets/api/api.dart';
import 'package:fitme_diets/models/dietsModel.dart';
import 'package:fitme_diets/models/serverResponse.dart';
import 'package:fitme_diets/utilities/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool isLiked = false;
  TabController _controller;
  PageController _pageController;

  Widget _singleTabWidget(DietModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text(
        '${model.titleDiet}',
      ),
    );
  }

  Widget _listCategories() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diets',
              style: titleStyle,
            ),
            TabBar(
              tabs: diets.map((diet) => _singleTabWidget(diet)).toList(),
              controller: _controller,
              isScrollable: true,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.grey.withOpacity(0.6),
              labelPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
            )
          ],
        ));
  }

  Widget _singleRecipeWidget(Result result) {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 250,
            color: Colors.white,
            child: Container(
              height: 250,
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blueAccent[100],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.circular(16))),
                        padding: EdgeInsets.all(12),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          child: isLiked
                              ? Icon(Icons.favorite, size: 16, color: Colors.red)
                              : Icon(Icons.favorite_border,
                                  size: 16, color: Colors.black54),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      '${result.title}',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/detail'),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.network(
                    '${result.image}',
                    height: 160,
                  ),
                ),
              ),
            ),
          )
        ],
    );
  }


  @override
  void initState() {
    super.initState();
    _controller = new TabController(initialIndex: 0, length: 6, vsync: this);
    _pageController = new PageController(viewportFraction: 0.7);
  }

  API _api = new API();
  Future<ServerResponse> _dataResponse() async {
    var response = await _api.getRecipe();
    print(response);
    return response;
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 50),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey, Jon',
                style: subtitleStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'What do you want to\ncook today?',
                style: titleStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 50),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Search any recipes',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder()),
                ),
              ),
              _listCategories(),
              Text(
                'Popular Recipes',
                style: titleStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                child: FutureBuilder<ServerResponse>(
                  future: _dataResponse(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return PageView(
                          controller: _pageController,
                          children: snapshot.data.results.map((map) => _singleRecipeWidget(map)).toList(),
                        );
                      }
                      return SpinKitDoubleBounce(
                        size: 100,
                        color: Colors.blueAccent,
                      );
                    },),
              )
            ],
          ),
        ),
      ),
    );
  }
}

