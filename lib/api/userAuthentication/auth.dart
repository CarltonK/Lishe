import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitme_diets/models/userModel.dart';

class AuthService {

   //Identify current user
  FirebaseUser currentUser;

  //create instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create instance of Firestore
  final Firestore _firestore = Firestore.instance;

  AuthService() {
    print('An instance of authentication has started');
  }

 /*
  USER REGISTRATION
  */
  //Create User
  Future createUserEmailPass(User user) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password
      );

      //The User has registered successfully
      currentUser = result.user;

      //Get the uid
      String uid = currentUser.uid;

      //Assign UID
      user.uid = uid;

      //Initiate email verification
      currentUser.sendEmailVerification();

      print('Positive Registration Response: ${currentUser.uid}');
      //Try adding the user to the Firestore
      await saveUser(user, uid);
      //notifyListeners();
      return Future.value(currentUser);
    } catch (e) {
      print(e);
      var response;
      if (e.toString().contains("ERROR_WEAK_PASSWORD")) {
        response = 'Your password is weak. Please choose another';
        //print('Negative Response: $response');
      }
      if (e.toString().contains("ERROR_INVALID_EMAIL")) {
        response = 'The email format entered is invalid';
        //print('Negative Response: $response');
      }
      if (e.toString().contains("ERROR_EMAIL_ALREADY_IN_USE")) {
        response = 'An account with the same email exists';
        //print('Negative Response: $response');
      }
      return response;
    }
  }

  Future saveUser(User user, String uid) async {
    await _firestore.collection('users').document(uid).setData(user.toJson());
  }
}
