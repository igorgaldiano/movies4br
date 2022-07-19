import 'package:flutter/material.dart';
import 'package:movies4br/screens/home_movies.dart';

import 'package:movies4br/service/auth_service.dart';
import 'package:movies4br/utils/reusable.dart';
import 'package:movies4br/widgets/trending.dart';

class SignInMovies extends StatefulWidget {
  const SignInMovies({Key? key}) : super(key: key);

  @override
  State<SignInMovies> createState() => _SignInMoviesState();
}

class _SignInMoviesState extends State<SignInMovies> {
  final formkey = GlobalKey<FormState>();
  bool loading = false;
  var email = TextEditingController();
  var password = TextEditingController();

  final TextStyle style =
      const TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    //Login com email
    final emailField = TextFormField(
      obscureText: false,
      controller: email,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined, color: Colors.black38),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Email",
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
      validator: (value) {
           if (value!.isEmpty) {
          return 'Inform your email';
        }
      },
    
    );

    //password
    final passwordField = TextFormField(
      obscureText: true,
       controller: password,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: Colors.black38,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Password",
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
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  Text(
                    'Sign into your account',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            emailField,
            const SizedBox(height: 20.0),
            passwordField,
            const SizedBox(height: 20.0),
            signInSignButton(context, true, () {  
              
                    AuthService.instance.login(email.text.trim(),password.text.trim());
                    setState(() {
                      loading = true;
                      });
                      if(loading){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => HomeMovies()));
                      }
                       
               
            }),
               
            signUpOption(context)

          //  signUpOption(context),
          ]),
        )),
      ),
    );
  }
}
