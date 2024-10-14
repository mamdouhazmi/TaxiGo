import 'package:flutter/material.dart';
import 'package:taxigo/pages/WelcomeScreen.dart';
import 'dart:async'; // Import for Timer

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to WelcomeScreen after 5 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1D1AD8), // Start color
              Color(0xFF0F0E72), // End color
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Your logo or splash image
              Image.asset(
                'assets/logo.png', // Replace with your image path
                height: 300, // Adjust the height according to your design
              ),
              const SizedBox(height: 10),
              const Text(
                "TAXI GO", // Optional welcome message
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24, // Adjust font size
                  fontWeight: FontWeight.bold, // Make text bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
