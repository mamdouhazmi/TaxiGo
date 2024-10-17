import 'package:flutter/material.dart';
import 'package:taxigo/presentation/WelcomeScreen.dart'; // Ensure WelcomeScreen is correctly imported
import 'dart:async'; // Import for Timer

void main() => runApp(const TaxiGoApp());

class TaxiGoApp extends StatelessWidget {
  const TaxiGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to WelcomeScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                const WelcomeScreen()), // Replace with the correct target screen
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/Vector.png', // Replace with your image path
                width: 100,
                height: 100, // Adjust the height according to your design
              ),
              const SizedBox(height: 12),
              const Text(
                'TAXI GO',
                style: TextStyle(
                  fontFamily: 'Post No Bills Colombo',
                  fontWeight: FontWeight.w800,
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
