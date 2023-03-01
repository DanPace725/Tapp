import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const TappApp());
}

class TappApp extends StatelessWidget {
  const TappApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tapp',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
