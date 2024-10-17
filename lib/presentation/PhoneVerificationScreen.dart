import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:taxigo/presentation/SetPasswordScreen.dart';

void main() {
  runApp(const TaxiGoApp());
}

class TaxiGoApp extends StatelessWidget {
  const TaxiGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PhoneVerificationScreen(),
    );
  }
}

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('./assets/angle-left.png'),
          onPressed: () {
            // Navigate back
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
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Phone verification',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2A2A2A),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter your OTP code',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA0A0A0),
              ),
            ),
            const SizedBox(height: 32),
            OtpTextField(
              numberOfFields: 6,
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              borderColor: const Color(0xFFCCCCCC),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                // Handle code submission
              },
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                text: 'Didn’t receive code? ',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF5A5A5A),
                ),
                children: [
                  TextSpan(
                    text: 'Resend again',
                    style: const TextStyle(
                      color: Color(0xFF1D1AD8),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle resend
                      },
                  )
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity, // Make the button full width
              height: 54.0, // Fixed height for the button
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D1AD8),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  // Navigate to SetPasswordScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SetPasswordScreen()),
                  );
                },
                child: const Text(
                  'Verify',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
