import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  Timestamp registerDate;
  String lastName;
  String phone;
  String firstName;
  String email;
  String uid;

  User({
    this.registerDate,
    this.lastName,
    this.phone,
    this.firstName,
    this.email,
    this.uid,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        registerDate: json["registerDate"],
        lastName: json["lastName"],
        phone: json["phone"],
        firstName: json["firstName"],
        email: json["email"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "registerDate": registerDate,
        "lastName": lastName,
        "phone": phone,
        "firstName": firstName,
        "email": email,
        "uid": uid,
      };
}
