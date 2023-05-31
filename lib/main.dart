import 'package:flutter/material.dart';
import 'package:morse_code_app/splash_page.dart';

import 'morse_entity.dart';

void main() {
  runApp(const MyMorseCodeApp());
}

class MyMorseCodeApp extends StatelessWidget {
  const MyMorseCodeApp({super.key});

    @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Morse Code Converter',

        home: SplashScreen(),
      );

  }
}

