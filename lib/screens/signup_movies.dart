import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies4br/screens/signin_movies.dart';
import 'package:movies4br/utils/reusable.dart';

class SignUpMovies extends StatefulWidget {
  const SignUpMovies({Key? key}) : super(key: key);

  @override
  State<SignUpMovies> createState() => _SignUpMoviesState();
}

class _SignUpMoviesState extends State<SignUpMovies> {
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final TextEditingController _confirmPasswordInputController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          // ignore: prefer_const_constructors

          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.amberAccent, Colors.white],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ignore: prefer_const_constructors
                  Padding(
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  Form(
                    child: Column(children: [
                      //Nome Completo
                      TextFormField(
                        controller: _nameInputController,
                        autofocus: false,
                        style: const TextStyle(color: Colors.black),
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: "Enter Username",
                          // ignore: prefer_const_constructors
                          labelStyle: TextStyle(color: Colors.black),
                          // ignore: prefer_const_constructors
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),

                          // ignore: prefer_const_constructors
                          focusedBorder: UnderlineInputBorder(
                            // ignore: prefer_const_constructors
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          enabledBorder: UnderlineInputBorder(
                            // ignore: prefer_const_constructors
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      // E-mail
                      TextFormField(
                        controller: _mailInputController,
                        autofocus: false,
                        style: const TextStyle(color: Colors.black),
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: "Enter Email",
                          // ignore: prefer_const_constructors
                          labelStyle: TextStyle(color: Colors.black),
                          // ignore: prefer_const_constructors
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.black,
                          ),
                          // ignore: prefer_const_constructors
                          focusedBorder: UnderlineInputBorder(
                            // ignore: prefer_const_constructors
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          enabledBorder: UnderlineInputBorder(
                            // ignore: prefer_const_constructors
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Inform your email correctly';
                          }
                          return null;
                        },
                      ),

                      // Password
                      TextFormField(
                        controller: _passwordInputController,
                        obscureText: true,
                        autofocus: false,
                        // ignore: prefer_const_constructors
                        style: TextStyle(color: Colors.black),
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          // ignore: prefer_const_constructors
                          labelStyle: TextStyle(color: Colors.black),
                          // ignore: prefer_const_constructors
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.black,
                          ),
                          // ignore: prefer_const_constructors
                          focusedBorder: UnderlineInputBorder(
                            // ignore: prefer_const_constructors
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          enabledBorder: UnderlineInputBorder(
                            // ignore: prefer_const_constructors
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Inform your password!';
                          } else if (value.length < 6) {
                            return 'Your password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      // Confirm password
                      TextFormField(
                        controller: _confirmPasswordInputController,
                        obscureText: true,
                        autofocus: false,
                        // ignore: prefer_const_constructors
                        style: TextStyle(color: Colors.black),
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: "Confirm your Password",
                          // ignore: prefer_const_constructors
                          labelStyle: TextStyle(color: Colors.black),
                          // ignore: prefer_const_constructors
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.black,
                          ),
                          // ignore: prefer_const_constructors
                          focusedBorder: UnderlineInputBorder(
                            // ignore: prefer_const_constructors
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          enabledBorder: UnderlineInputBorder(
                            // ignore: prefer_const_constructors
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      signInSignButton(context, false, () {
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: _mailInputController.text,
                            password: _passwordInputController.text);
                      }),
                    ]),
                  )

                  //construção do botao
                ]),
          ),
        ));
  }
}
