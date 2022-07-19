import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies4br/screens/loading.dart';
import 'package:movies4br/screens/signin_movies.dart';
import 'package:movies4br/service/auth_service.dart';
import 'package:movies4br/utils/reusable.dart';

class SignUpMovies extends StatefulWidget {
  const SignUpMovies({Key? key}) : super(key: key);

  @override
  State<SignUpMovies> createState() => _SignUpMoviesState();
}

class _SignUpMoviesState extends State<SignUpMovies> {
  var password = TextEditingController();
  var email = TextEditingController();
  var confirmPassword = TextEditingController();
  final TextStyle style =
      const TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);

  List images = ["g.png", "f.png", "i.png"];
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
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
    );

    //password
    final passwordField = TextField(
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
    );

    final confirmPasswordField = TextField(
      obscureText: true,
      controller: confirmPassword,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: Colors.black38,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Confirm your Password",
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
    );
    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset("images/logo2.png", fit: BoxFit.contain),
                ),

                // ignore: prefer_const_constructors
                SizedBox(height: 10.0),
                emailField,
                const SizedBox(height: 20.0),
                passwordField,
                const SizedBox(height: 20.0),
                confirmPasswordField,
                const SizedBox(height: 20.0),
                signInSignButton(
                  context,
                  false,
                  () {
                    AuthService.instance
                        .register(email.text.trim(), password.text.trim());
                  },
                 
                ),
                 SizedBox(
                  height: 20,
                ),
                RichText(text: TextSpan(text: 'Back to Sign in Page', style: TextStyle(color: Colors.orange[500], fontSize: 16, fontWeight: FontWeight.bold), recognizer: TapGestureRecognizer()..onTap = () {
                   Navigator.pop(context, MaterialPageRoute(
                                builder: (context) => SignUpMovies()),);
                } 
                
                )),
                SizedBox(height: 20,),
                RichText(
                    text: TextSpan(
                  text: "Sign up using one of the following methods",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                )),
                Wrap(
                    children: List<Widget>.generate(
                  3,
                  ((index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage("images/" + images[index]),
                      ),
                    );
                  }),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
