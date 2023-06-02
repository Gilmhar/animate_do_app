import 'package:flutter/material.dart';

import 'package:animate_do_app/src/pagina1_page.dart';
//import 'package:animate_do_app/src/twitter_page.dart';
//import 'package:animate_do_app/src/navegacion_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.amber[800],
          secondary: Colors.green
        ),
      ),
      title: 'Material App',
      home:const Pagina1Page()
    );
  }
}

