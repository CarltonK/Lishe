import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  Timestamp registerDate;
  String lastName;
  String phone;
  String firstName;
  String email;
  String uid;
  String password;

  User({
    this.registerDate,
    this.lastName,
    this.phone,
    this.firstName,
    this.email,
    this.uid,
    this.password
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        registerDate: json["registerDate"],
        lastName: json["lastName"],
        phone: json["phone"],
        firstName: json["firstName"],
        email: json["email"],
        uid: json["uid"],
        password: json['password']
      );

  Map<String, dynamic> toJson() => {
        "registerDate": registerDate,
        "lastName": lastName,
        "phone": phone,
        "firstName": firstName,
        "email": email,
        "uid": uid,
        "password": password
  };
}
