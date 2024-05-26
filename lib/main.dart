import 'package:flutter/material.dart';
import 'package:latin_to_ktill/splash_screen.dart';

void main() {
  runApp(const TextConverterApp());
}

class TextConverterApp extends StatelessWidget {
  const TextConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "LatinToKrill",
      home: SplashScreen(),
    );
  }
}
