import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies4br/screens/home_movies.dart';
import 'package:movies4br/screens/loading.dart';
import 'package:movies4br/screens/signin_movies.dart';
import 'package:movies4br/screens/welcome_page.dart';

class AuthService extends GetxController {
  static AuthService instance = Get.find();
  //email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //Our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print('login page');
      Get.offAll(() => const SignInMovies());
    } else {
   
      Get.offAll(() {
        HomeMovies();   

      });
    
    }
  }

  //registrar no Firebase
  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed. Check it out the errors",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  //realizar login
  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      
    } catch (e) {
      Get.snackbar("About Login", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed. Check it out errors",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

//realizar logout
  Future<void> logOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
