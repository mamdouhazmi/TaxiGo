import 'package:flutter/material.dart';

void main() {
  runApp(const SendVerificationPage());
}

class SendVerificationPage extends StatelessWidget {
  const SendVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:
            Colors.white, // Set the background color of the page to white
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Image.asset('./assets/angle-left.png'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Back',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF414141),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Verification email or phone number',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Color(0xFF2A2A2A),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email or phone number',
                  hintStyle: const TextStyle(color: Color(0xFFD0D0D0)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFB8B8B8)),
                  ),
                ),
              ),
              const Spacer(),
              _buildSendOTPButton(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // This method replicates the style of the Sign Up button
  Widget _buildSendOTPButton() {
    return SizedBox(
      width: double.infinity,
      height: 54.0, // Same height as the Sign Up button
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              const Color(0xFF1D1AD8), // Same color as the Sign Up button
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0), // Same border radius as the Sign Up button
            ),
          ),
        ),
        onPressed: () {
          // Action for Send OTP button
        },
        child: const Text(
          'Send OTP',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.white, // Same text color as the Sign Up button
          ),
        ),
      ),
    );
  }
}
