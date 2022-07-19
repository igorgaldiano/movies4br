import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies4br/screens/home_movies.dart';
import 'package:movies4br/screens/loading.dart';
import 'package:movies4br/screens/signin_movies.dart';
import 'package:movies4br/screens/signup_movies.dart';

import 'package:movies4br/screens/welcome_page.dart';

class MeuAppMovies extends StatelessWidget {
  const MeuAppMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movies 4 Brazil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/signin',
      routes: {
        '/signin': (_)=> const SignInMovies(),
        '/loading': (_)=> const Loading(),
        'homemovies': (_)=> HomeMovies(),
        
      },
      home: HomeMovies(),
    );
  }
}