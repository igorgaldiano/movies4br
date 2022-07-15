import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies4br/screens/home_movies.dart';
import 'package:movies4br/screens/splash_pages.dart';
import 'package:movies4br/service/auth_service.dart';
import 'package:movies4br/utils/reusable.dart';

class SignInMovies extends StatefulWidget {
  const SignInMovies({Key? key}) : super(key: key);

  @override
  State<SignInMovies> createState() => _SignInMoviesState();
}

class _SignInMoviesState extends State<SignInMovies> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final TextStyle style =
      const TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);

  login() async {
    try {
      await AuthService()
          .login(_mailInputController.text, _passwordInputController.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    //Login com email
    final emailField = TextFormField(
      obscureText: false,
      controller: _mailInputController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined, color: Colors.black38),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Enter Email",
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
    );

    //password
    final passwordField = TextFormField(
      obscureText: true,
      style: style,
      controller: _passwordInputController,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: Colors.black38,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Enter Password",
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Inform your password!';
        } else if (value.length < 6) {
          return 'Your password must be at least 6 characters';
        }
        return null;
      },
    );

    final buttonLogin = Container(
      // ignore: prefer_const_constructors
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      height: 50,
      width: MediaQuery.of(context).size.width,

      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
          color: Colors.redAccent,
          // ignore: prefer_const_constructors
          borderRadius: BorderRadius.circular(90)),
      child: TextButton(
        // ignore: prefer_const_constructors
        child: Center(
          // ignore: prefer_const_constructors
          child: Text(
            'SIGN IN',
            // ignore: prefer_const_constructors
            style: TextStyle(color: Colors.white),
          ),
        ),
        onPressed: () {
          if (formkey.currentState!.validate()) {
            AuthService().register(
                _mailInputController.text, _passwordInputController.text);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeMovies()));
          }
        },
      ),
    );

// chama botao de login
    Container signInSignButton(
        BuildContext context, bool isLogin, Function onTap) {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
        child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          // ignore: sort_child_properties_last
          child: Text(
            isLogin ? 'LOG IN' : 'SIGN UP',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.red;
                }
                return Colors.red;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
        ),
      );
    }

    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(children: <Widget>[
            SizedBox(
              height: 150,
              child: Image.asset("images/logo.png", fit: BoxFit.contain),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 30,
              child:
                  // ignore: prefer_const_constructors
                  Text(
                'WELCOME TO MOVIES 4 BRAZIL 🇧🇷 ',
                textDirection: TextDirection.ltr,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 30.0),
            emailField,
            const SizedBox(height: 20.0),
            passwordField,
            const SizedBox(height: 20.0),
            signInSignButton(context, true, () {
              
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Splash()));
             
            }),

            signUpOption(context),
          ]),
        )),
      ),
    );
  }
}
