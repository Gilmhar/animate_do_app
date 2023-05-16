import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:animate_do_app/src/twitter_page.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(child: const Text('Animate_do')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => const TwitterPage()));
              }, icon: const FaIcon(FontAwesomeIcons.twitter)),
          SlideInLeft(
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => const Pagina1Page()));
                },
                icon: const FaIcon(FontAwesomeIcons.chevronRight)),
          )
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {},
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
                delay: const Duration(milliseconds: 1100),
                child: const Icon(Icons.new_releases,
                    color: Colors.blue, size: 40)),
            FadeInDown(
              delay: const Duration(milliseconds: 1500),
              child: const Text(
                'Título',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 800),
              child: const Text(
                'Soy un pequeño',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
