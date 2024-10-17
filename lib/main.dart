import 'package:flutter/material.dart';
// import 'package:taxigo/presentation/SplashScreen.dart';
import 'package:taxigo/presentation/SplashScreen0.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi GO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, 
      home: SplashScreen0(), // Set the SplashScreen as the home widget
    );
  }
}
