import 'package:fitme_diets/models/diet.dart';
import 'package:fitme_diets/models/intolerances.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String names;
  String number;
  String email;
  String password;
  List<Intolerances> userIntolerances;
  Diet userDiet;
  String regChoice;

  User(
      {this.names,
      this.number,
      this.email,
      this.password,
      this.userIntolerances,
      this.userDiet,
      this.regChoice});

  factory User.fromJson(Map<String, dynamic> json) => User(
        //userIntolerances: List<Intolerances>.from(json["intolerances"].map((x) => Intolerances.fromJson(x))),
        names: json["names"],
        number: json["number"],
        email: json["email"],
        password: json["password"],
        regChoice: json["regChoice"],
    );


  Map<String, dynamic> toJson() => {
        //"userIntolerances": List<dynamic>.from(userIntolerances.map((x) => x.toJson())),
        "names": names,
        "number": number,
        "email": email,
        "password": password,
        "regChoice": regChoice,
        "userDiet": number,
        
    };
}
