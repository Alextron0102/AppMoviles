import 'package:flutter/material.dart';
import 'package:flutter_app_pokemon_networking/src/pages/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      debugShowCheckedModeBanner: false,//Esto es para eliminar la bandera de debug
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}