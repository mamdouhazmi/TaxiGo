import 'package:flutter/material.dart';
import 'package:taxigo/pages/LogIn.dart';
import 'package:taxigo/pages/SignUp.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after a specified duration if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1D1AD8), // Start color
              Color(0xFF0F0E72), // End color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center the content vertically
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/welcome.png', // Replace with your image path
                    height: 300, // Adjust height as needed
                  ),
                  const SizedBox(height: 20),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Welcome\n",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold, // Make "Welcome" bold
                          ),
                        ),
                        TextSpan(
                          text: "Have a better sharing experience",
                          style: TextStyle(
                            color: Color(0xd8d8d8ff),
                            fontSize: 16,
                            fontWeight:
                                FontWeight.normal, // Normal weight for the rest
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
                height:
                    40), // SizedBox to create space between the image/text and buttons
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 20.0), // Keep the padding for the buttons
              child: Column(
                children: [
                  SizedBox(
                    width: 362, // Fixed width
                    height: 54, // Fixed height
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(
                            93.5, 15.5, 93.5, 15.5), // Padding
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(8)), // Custom border radius
                          side: BorderSide(
                            width: 1,
                            color: Colors
                                .transparent, // Set the border color as needed
                          ),
                        ),
                        backgroundColor: Colors.white, // Background color
                        foregroundColor: const Color(0xFF1D1AD8), // Text color
                        elevation: 0, // No elevation
                      ),
                      onPressed: () {
                        // Navigate to Sign Up page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Text("Create an account"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 362, // Fixed width
                    height: 54, // Fixed height
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(
                            93.5, 15.5, 93.5, 15.5), // Padding
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(8)), // Custom border radius
                          side: BorderSide(
                            width: 1,
                            color:
                                Colors.white, // Set the border color as needed
                          ),
                        ),
                        backgroundColor:
                            const Color(0xFF0F0E72), // Background color
                        foregroundColor: Colors.white, // Text color
                        elevation: 0, // No elevation
                      ),
                      onPressed: () {
                        // Navigate to Log In page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text("Log In"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
