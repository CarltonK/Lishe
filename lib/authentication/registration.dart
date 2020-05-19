import 'dart:async';

import 'package:fitme_diets/widgets/globalWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  //Placeholders (TextField)
  String _email, _password1, _firstName, _lastName, _password2, _phone;
  double _opacity = 0;
  //Placeholders (Focus)
  final FocusNode focuslastName = FocusNode();
  final FocusNode focusPhone = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword1 = FocusNode();
  final FocusNode focusPassword2 = FocusNode();
  //Placeholder (Form)
  final _formKey = GlobalKey<FormState>();
  //Placeholder (Obscurity)
  bool _isPasswordVisible = true;

  //Handle Text Field Inputs
  void _handleFirstNameInput(String value) {
    _firstName = value.trim();
    print(_firstName);
  }

  void _handleLastNameInput(String value) {
    _lastName = value.trim();
    print(_lastName);
  }

  void _handleEmailInput(String value) {
    _email = value.trim();
    print(_email);
  }

  void _handlePhoneInput(String value) {
    _phone = value.trim();
    print(_phone);
  }

  void _handlePassword1Input(String value) {
    _password1 = value.trim();
    print(_password1);
  }

  void _handlePassword2Input(String value) {
    _password2 = value.trim();
    print(_password2);
  }

  Widget _firstNameTF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.grey[200]),
        child: TextFormField(
          autofocus: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(focuslastName);
          },
          validator: (value) {
            //Check if first name exists
            if (value.isEmpty) {
              return 'Please provide your first name';
            }
            return null;
          },
          onSaved: _handleFirstNameInput,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              labelText: 'First Name',
              prefixIcon: Icon(Icons.person)),
        ));
  }

  Widget _lastNameTF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.grey[200]),
        child: TextFormField(
          autofocus: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(focusEmail);
          },
          focusNode: focuslastName,
          validator: (value) {
            //Check if last name exists
            if (value.isEmpty) {
              return 'Please provide your last name';
            }
            return null;
          },
          onSaved: _handleLastNameInput,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              labelText: 'Last Name',
              prefixIcon: Icon(Icons.person)),
        ));
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
            FocusScope.of(context).requestFocus(focusPhone);
          },
          focusNode: focusEmail,
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
          onSaved: _handleEmailInput,
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

  Widget _phoneTF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.grey[200]),
        child: TextFormField(
          autofocus: false,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(focusPassword1);
          },
          validator: (value) {
            //Check if phone exists
            if (value.isEmpty) {
              return 'Please provide a phone number';
            }
            //Check if phone is not 10 digits
            if (value.length != 10) {
              return 'Your phone number should be 10 digits';
            }
            //Check if phone starts with '07'
            if (!value.startsWith('07')) {
              return 'Your phone number should start with 07';
            }
            return null;
          },
          focusNode: focusPhone,
          onSaved: _handlePhoneInput,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              labelText: 'Phone',
              prefixIcon: Icon(Icons.phone)),
        ));
  }

  Widget _password1TF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.grey[200]),
        child: TextFormField(
            autofocus: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusPassword2);
            },
            validator: (value) {
              //Check if email exists
              if (value.isEmpty) {
                return 'Please provide a password';
              }
              //Check if @ sign exists
              if (value.length < 7) {
                return 'Password is too short';
              }
              return null;
            },
            obscureText: _isPasswordVisible,
            focusNode: focusPassword1,
            onSaved: _handlePassword1Input,
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
                ))));
  }

  Widget _password2TF() {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.grey[200]),
        child: TextFormField(
          focusNode: focusPassword2,
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
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
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            labelText: 'Confirm Password',
            prefixIcon: Icon(Icons.vpn_key),
          ),
        ));
  }

  void _signUpBtnPressed() {
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

  Widget registrationBody() {
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
                'Sign Up',
                style: GoogleFonts.muli(
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Please provide your details',
                style: GoogleFonts.muli(
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                height: 40,
              ),
              _firstNameTF(),
              SizedBox(
                height: 20,
              ),
              _lastNameTF(),
              SizedBox(
                height: 20,
              ),
              _emailTF(),
              SizedBox(
                height: 20,
              ),
              _phoneTF(),
              SizedBox(
                height: 20,
              ),
              _password1TF(),
              SizedBox(
                height: 20,
              ),
              _password2TF(),
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
                    'Sign Up',
                    style: GoogleFonts.muli(
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  onPressed: _signUpBtnPressed),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    focusEmail.dispose();
    focusPhone.dispose();
    focuslastName.dispose();
    focusPassword1.dispose();
    focusPassword2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [backGround(), registrationBody(), progress(_opacity)],
        ),
      ),
    );
  }
}
