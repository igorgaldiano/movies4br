import 'package:flutter/material.dart';
import 'package:movies4br/screens/home_movies.dart';
import 'package:movies4br/screens/signin_movies.dart';
import 'package:movies4br/screens/splash_pages.dart';



class MeuAppMovies extends StatelessWidget {
  const MeuAppMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies 4 Brazil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: SignInMovies(),
    );
  }
}