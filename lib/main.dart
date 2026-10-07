import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(ShopEaseApp());
}

class ShopEaseApp extends StatelessWidget {
  ShopEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopEase',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
      ),
      home: SplashScreen(),
    );
  }
}