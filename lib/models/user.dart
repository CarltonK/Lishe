import 'package:fitme_diets/models/diet.dart';
import 'package:fitme_diets/models/intolerances.dart';

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
}
