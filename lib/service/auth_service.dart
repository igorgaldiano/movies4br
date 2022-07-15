import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/signup_movies.dart';

//autentication service for sign in, sign up
class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;
  bool isLoading = true;

  //construtor
  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? usuario) {
      user = (usuario == null) ? null : usuario;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    user = _auth.currentUser;
    notifyListeners();
  }

  //register
  register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('The password is too weak!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('This email is already registered');
      }
    }
  }

  //login
  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email not found. Register!');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Wrong password, try again...');
      }
    }
  }

  //logout
  logout() async {
    await _auth.signOut();
    _getUser();
  }

  

}
