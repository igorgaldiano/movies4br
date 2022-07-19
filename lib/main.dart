import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies4br/meu_app_movies.dart';
import 'package:movies4br/service/auth_service.dart';



Future<void> main() async {
  // inicializacao dos modulosd
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthService()));
  runApp(const MeuAppMovies());
}
