import 'package:flutter/material.dart';

class LoginMovies extends StatefulWidget {
  LoginMovies({Key? key}) : super(key: key);

  @override
  State<LoginMovies> createState() => _LoginMoviesState();
}

class _LoginMoviesState extends State<LoginMovies> {
  final formkey = GlobalKey<FormState>();
  final password = TextEditingController();
  final email = TextEditingController();
  final TextStyle style =
      const TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);

  bool isLogin = true;

  late String actionButton;
  late String toggleButton;
  late String signUpButton;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool action) {
    setState(() {
      isLogin = action;
      if (isLogin) {
        actionButton = 'SIGN IN';
        toggleButton = "Don't have an account? SIGN UP";
        
      } else {
        actionButton = 'SIGN UP';
        toggleButton = "Back to Login Screen";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Login com email
    final emailField = TextFormField(
      obscureText: false,
      controller: email,
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
      validator: (value) {
        if (value!.isEmpty) {
          return 'Inform your email correctly';
        }
        return null;
      },
    );

    //password
    final passwordField = TextField(
      obscureText: true,
      style: style,
      controller: password,
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
    );

    //botao de login
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
      child: ElevatedButton(
        
        // ignore: prefer_const_literals_to_create_immutables
        child: Row(children: [ const
          Icon(Icons.check),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center( child: Text(
              actionButton,
              style: const TextStyle(fontSize: 16),
            ),),
          
           
          )
        ]),
        onPressed: () {},
      ),
    );

    final buttonSignup = TextButton(
      onPressed: () => setFormAction(!isLogin),
      child: Text(toggleButton,
       style: const TextStyle(color: Colors.black45),),
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
            buttonLogin,
            const SizedBox(height: 20.0),
            buttonSignup
          ]),
        )),
      ),
    );
  }
}
