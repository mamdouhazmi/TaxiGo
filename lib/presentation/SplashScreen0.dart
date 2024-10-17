import 'package:flutter/material.dart';
import 'dart:async';

import 'package:taxigo/presentation/SplashScreen1.dart'; // Import for Timer

void main() => runApp(const TaxiGoApp());

class TaxiGoApp extends StatelessWidget {
  const TaxiGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen0(),
    );
  }
}

class SplashScreen0 extends StatefulWidget {
  const SplashScreen0({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen0> {
  @override
  void initState() {
    super.initState();
    // Navigate to SplashScreen1 after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                const SplashScreen1()), // Navigate to SplashScreen1
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 29, 26, 216),
              Color.fromARGB(255, 15, 14, 114),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Text(
                  'TAXI \nGO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Post No Bills Colombo',
                    fontWeight: FontWeight.w800,
                    fontSize: 100,
                    color: Colors.white,
                    height: 1.14, // Equivalent to 114% line height
                  ),
                ),
              ),
              Image.asset(
                'assets/Vector0.png', // Replace with your image path
                width: 100,
                height: 100, // Adjust the height according to your design
              ),
            ],
          ),
        ),
      ),
    );
  }
}
