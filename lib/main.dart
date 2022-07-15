import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies4br/meu_app_movies.dart';


Future<void> main() async {
  // inicializacao dos modulosd
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MeuAppMovies());
}
