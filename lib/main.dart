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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Pagina1Page()
    );
  }
}

