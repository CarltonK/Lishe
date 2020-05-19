import 'dart:async';

import 'package:fitme_diets/widgets/globalWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Placeholders (TextField)
  String _email, _password;
  double _opacity = 0;
  //Placeholders (Focus)
  final FocusNode focusPassword = FocusNode();
  //Placeholder (Form)
  final _formKey = GlobalKey<FormState>();
  //Placeholder (Obscurity)
  bool _isPasswordVisible = true;

  //Handle Text Field Inputs
  void _handleEmailInput(String value) {
    _email = value.trim();
    print(_email);
  }

  void _handlePasswordInput(String value) {
    _password = value.trim();
    print(_password);
  }

  Widget _emailTF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.grey[200]),
        child: TextFormField(
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(focusPassword);
          },
          onSaved: _handleEmailInput,
          validator: (value) {
            //Check if email exists
            if (value.isEmpty) {
              return 'Please provide an email';
            }
            //Check if @ sign exists
            if (!value.contains('@') || !value.contains('.')) {
              return 'Please provide a valid email';
            }
            return null;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              labelText: 'Email',
              prefixIcon: Icon(Icons.email)),
        ));
  }

  Widget _passwordTF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.grey[200]),
        child: TextFormField(
          focusNode: focusPassword,
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
          onSaved: _handlePasswordInput,
          autofocus: false,
          validator: (value) {
            //Check if password exists
            if (value.isEmpty) {
              return 'Please provide a password';
            }
            //Check if password is more that 7 characters
            if (value.length < 7) {
              return 'Password is too short';
            }
            return null;
          },
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          obscureText: _isPasswordVisible,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              labelText: 'Password',
              prefixIcon: Icon(Icons.vpn_key),
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )),
        ));
  }

  void _signInBtnPressed() {
     //Access form
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      //Show the progress
      setState(() {
        _opacity = 1;
      });
      //Dismiss dialog after two seconds
      Timer(Duration(seconds: 2), () {
        setState(() {
          _opacity = 0;
        });
      });
    }
  }

  Widget loginBody() {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 100, left: 20, right: 20),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign In',
                style: GoogleFonts.muli(
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Please fill in your credentials',
                style: GoogleFonts.muli(
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                height: 40,
              ),
              _emailTF(),
              SizedBox(
                height: 20,
              ),
              _passwordTF(),
              SizedBox(
                height: 40,
              ),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  elevation: 5,
                  height: 55,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  color: Colors.red,
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.muli(
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  onPressed: _signInBtnPressed),
              SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  'Don\'t have an account?',
                  style: GoogleFonts.muli(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/registration'),
                child: Center(
                  child: Text(
                    'SIGN UP',
                    style: GoogleFonts.muli(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    focusPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [backGround(), loginBody(), progress(_opacity)],
        ),
      ),
    );
  }
}
