import 'package:fitme_diets/models/choice_model.dart';
import 'package:fitme_diets/models/diet.dart';
import 'package:fitme_diets/models/intolerances.dart';
import 'package:fitme_diets/models/user.dart';
import 'package:fitme_diets/screens/more_choiceinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _choiceController;
  int _selectedChoice = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    _choiceController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  //Variable holders
  static String _email, _password, _phone;
  static String _names, _passwordConfirmation;

  static String _selectedDiet;
  static List<Intolerances> _selectedIntolerances = [];

  final focusPassword = FocusNode();
  final focusPasswordConfirmation = FocusNode();
  final focusEmail = FocusNode();
  final focusNumber = FocusNode();

  //A class to hold the current user registering
  final User curUser = User();

  List<Diet> dietItems = [
    glutenFree,
    ketogenic,
    vegeterian,
    lactoVegeterian,
    ovoVegeterian,
    vegan,
    pesceterian,
    paleo,
    primal,
    whole30
  ];

  List<Intolerances> intolerantItems = [
    egg,
    dairy,
    treeNut,
    sesame,
    seafood,
    wheat,
    grain,
    gluten,
    peanut,
    shellfish,
    soy,
    sulfite
  ];

  //Form Keys
  static var _namesForm = GlobalKey<FormState>();
  static var _emailForm = GlobalKey<FormState>();
  static var _phoneForm = GlobalKey<FormState>();
  static var _passwordForm = GlobalKey<FormState>();
  static var _passwordConfirmationForm = GlobalKey<FormState>();

  bool _validateForms() {
    if (_namesForm.currentState.validate() &&
        _phoneForm.currentState.validate() &&
        _emailForm.currentState.validate() &&
        _passwordForm.currentState.validate() &&
        _passwordConfirmationForm.currentState.validate()) {
      _namesForm.currentState.save();
      _emailForm.currentState.save();
      _phoneForm.currentState.save();
      _passwordForm.currentState.save();
      _passwordConfirmationForm.currentState.save();

      curUser.names = _names;
      curUser.number = _phone;
      curUser.email = _email;
      curUser.password = _password;

      return true;
    } else if (_password != _passwordConfirmation) {
      print('Passwords do not match');
      return false;
    }

    return false;
  }

  void _handleSavedName(String value) {
    _names = value;
    print('Name: ' + _names);
  }

  void _handleSavedNumber(String value) {
    _phone = value;
    print('Phone: ' + _phone);
  }

  void _handleSavedEmail(String value) {
    _email = value;
    print('Email: ' + _email);
  }

  void _handleSavedPassword(String value) {
    _password = value;
    print('Password: ' + _password);
  }

  void _handleSavedPasswordConfirmation(String value) {
    _passwordConfirmation = value;
    if (_password != _passwordConfirmation) {
      print('Passwords do not match');
    }
    print('Password Confirmation: ' + _passwordConfirmation);
  }

  final int _numPages = 2;
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  //Password and confirm password validators
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  Widget _namesWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style:
              TextStyle(color: Colors.white, fontSize: 16, letterSpacing: .2),
        ),
        SizedBox(
          height: 10,
        ),
        Form(
          key: _namesForm,
          child: TextFormField(
            style: TextStyle(color: Colors.white, fontSize: 18),
            validator: (value) {
              if (value.isEmpty) {
                return 'Your name is required';
              }
              return null;
            },
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusNumber);
            },
            onSaved: _handleSavedName,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.white)),
                labelText: 'What are your names ?',
                labelStyle: TextStyle(color: Colors.white, fontSize: 14),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14),
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        )
      ],
    );
  }

  Widget _mobileNumberWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Safaricom Number',
          style:
              TextStyle(color: Colors.white, fontSize: 16, letterSpacing: .2),
        ),
        SizedBox(
          height: 10,
        ),
        Form(
          key: _phoneForm,
          child: TextFormField(
            style: TextStyle(color: Colors.white, fontSize: 18),
            validator: (value) {
              if (value.isEmpty) {
                return 'Your number is required';
              }
              if (value.length != 10) {
                return 'Phone number should be 10 digits';
              }
              return null;
            },
            focusNode: focusNumber,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusEmail);
            },
            onSaved: _handleSavedNumber,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.white)),
                labelText: 'Please enter your safaricom phone number',
                labelStyle: TextStyle(color: Colors.white, fontSize: 14),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14),
                icon: Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        )
      ],
    );
  }

  Widget _emailWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style:
              TextStyle(color: Colors.white, fontSize: 16, letterSpacing: .2),
        ),
        SizedBox(
          height: 10,
        ),
        Form(
          key: _emailForm,
          child: TextFormField(
            style: TextStyle(color: Colors.white, fontSize: 18),
            validator: (value) {
              if (value.isEmpty) {
                return 'Your email is required';
              }
              return null;
            },
            focusNode: focusEmail,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusPassword);
            },
            onSaved: _handleSavedEmail,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.white)),
                labelText: 'Please enter your email',
                labelStyle: TextStyle(color: Colors.white, fontSize: 14),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14),
                icon: Icon(
                  Icons.email,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        )
      ],
    );
  }

  Widget _passwordWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style:
              TextStyle(color: Colors.white, fontSize: 16, letterSpacing: .2),
        ),
        SizedBox(
          height: 10,
        ),
        Form(
          key: _passwordForm,
          child: TextFormField(
            controller: _pass,
            style: TextStyle(color: Colors.white, fontSize: 18),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length < 8) {
                return 'Please enter 8 or more characters';
              }
              return null;
            },
            focusNode: focusPassword,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusPasswordConfirmation);
            },
            onSaved: _handleSavedPassword,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.white)),
                labelText: 'Please enter a secure password',
                labelStyle: TextStyle(color: Colors.white, fontSize: 14),
                helperText:
                    'To ensure a safe account, we require your password to\nbe at least 8 characters, including an upper case letter\nand a number',
                helperStyle: TextStyle(
                  color: Colors.white,
                ),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14),
                icon: Icon(
                  Icons.vpn_key,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        )
      ],
    );
  }

  Widget _confirmPasswordWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
          style:
              TextStyle(color: Colors.white, fontSize: 16, letterSpacing: .2),
        ),
        SizedBox(
          height: 10,
        ),
        Form(
          key: _passwordConfirmationForm,
          child: TextFormField(
            controller: _confirmPass,
            style: TextStyle(color: Colors.white, fontSize: 18),
            validator: (value) {
              if (value.isEmpty) {
                return 'Password confirmation is required';
              }
              if (value.length < 8) {
                return 'Please enter 8 or more characters';
              }
              if (value != _pass.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            focusNode: focusPasswordConfirmation,
            onSaved: _handleSavedPasswordConfirmation,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.white)),
                labelText: 'Please confirm your password',
                labelStyle: TextStyle(color: Colors.white, fontSize: 14),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14),
                icon: Icon(
                  Icons.vpn_key,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        )
      ],
    );
  }

  Widget _buildSignInBtn() {
    return GestureDetector(
      onTap: () {
        print('This will take you to the login page');
      },
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Already have an Account? ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: .1,
                    fontWeight: FontWeight.w300),
              ),
              TextSpan(
                text: 'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: .1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chooseIntolerances() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.indigo[900],
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              'Intolerances',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  letterSpacing: .5),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'What are you allergic to ? ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: .5),
            ),
            Text(
              '3/3',
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0),
                itemCount: intolerantItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _selectedIntolerances.add(intolerantItems[index]);
                      showDialog(
                          context: context,
                          child: CupertinoActionSheet(
                            message: Text(
                              'This means you are allergic to ' +
                                  intolerantItems[index].intolerantItemName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.indigo[900]),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  print('Select button pressed');
                                  curUser.userIntolerances =
                                      _selectedIntolerances;
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'SELECT',
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              )
                            ],
                            cancelButton: FlatButton(
                              onPressed: () {
                                print('Cancel button pressed');
                                Navigator.pop(context);
                              },
                              child: Text(
                                'CANCEL',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ));
                    },
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                            color: intolerantItems[index].intolerantItemSelected
                                ? Colors.grey
                                : Colors.white),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                                intolerantItems[index].intolerantItemImage),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              intolerantItems[index].intolerantItemName,
                              style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  letterSpacing: 0.1),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _chooseDiet() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.indigo[900],
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              'Let us know your diet',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  letterSpacing: .5),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'What would you prefer ? ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: .5),
            ),
            Text(
              '2/3',
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.0,
                ),
                itemCount: dietItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      //dietItems[index].selectedItem = true;
                      _selectedDiet = dietItems[index].dietName;
                      showDialog(
                          context: context,
                          child: CupertinoActionSheet(
                            title: Text(
                              dietItems[index].dietName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                  color: Colors.indigo[900]),
                            ),
                            message: Text(
                              dietItems[index].dietDescription,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.indigo[900]),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  print('Select button pressed');
                                  curUser.userDiet = dietItems[index];
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'SELECT',
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              )
                            ],
                            cancelButton: FlatButton(
                              onPressed: () {
                                print('Cancel button pressed');
                                Navigator.pop(context);
                              },
                              child: Text(
                                'CANCEL',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ));
                    },
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            color: dietItems[index].selectedItem
                                ? Colors.grey
                                : Colors.white),
                        child: Column(
                          children: <Widget>[
                            Image.asset(dietItems[index].dietImage),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              dietItems[index].dietName,
                              style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  letterSpacing: 0.1),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _choiceSelector(int index) {
    return AnimatedBuilder(
      animation: _choiceController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_choiceController.position.haveDimensions) {
          value = _choiceController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
            child: SizedBox(
          height: Curves.easeInOut.transform(value) * 500.0,
          width: Curves.easeInOut.transform(value) * 400.0,
          child: widget,
        ));
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ChoiceInfo(choice: choices[index])));
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 30.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: choices[index].imageUrl,
                      child: Image(
                        height: 250,
                        width: 280,
                        image: AssetImage('assets/ch$index.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.indigo[900],
                      ),
                      child: Center(
                          child: Text(
                        choices[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      choices[index].description,
                      style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Colors.indigo[900],
                Colors.indigo[900],
                Colors.indigo[900],
                Colors.indigo[900],
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Expanded(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo[900],
                        ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Let\'s get started',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    letterSpacing: .5),
                              ),
                              Text(
                                '1/2',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              _namesWidget(),
                              SizedBox(
                                height: 25,
                              ),
                              _mobileNumberWidget(),
                              SizedBox(
                                height: 25,
                              ),
                              _emailWidget(),
                              SizedBox(
                                height: 25,
                              ),
                              _passwordWidget(),
                              SizedBox(
                                height: 25,
                              ),
                              _confirmPasswordWidget(),
                              SizedBox(
                                height: 30,
                              ),
                              _buildSignInBtn(),
                              SizedBox(
                                height: 60,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo[900],
                        ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Set your goal',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    letterSpacing: .5),
                              ),
                              Text(
                                '2/2',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              SizedBox(height: 100),
                              Container(
                                height: 500,
                                width: double.infinity,
                                child: PageView.builder(
                                  controller: _choiceController,
                                  onPageChanged: (int index) {
                                    setState(() {
                                      _selectedChoice = index;
                                    });
                                  },
                                  itemCount: 3,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _choiceSelector(index);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 70.0,
        width: double.infinity,
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            if (_currentPage != _numPages - 1) {
              if (_currentPage == 0) {
                setState(() {
                  {
                    if (_validateForms()) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  }
                });
              }
            } else {
              //var _userData = curUser.toJson();
              Navigator.popAndPushNamed(context, '/homepage');
            }
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: _currentPage != _numPages - 1
                  ? Text(
                      'PROCEED',
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      'FINISH',
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
