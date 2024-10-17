import 'package:flutter/material.dart';

void main() {
  runApp(const TaxiGoApp());
}

class TaxiGoApp extends StatelessWidget {
  const TaxiGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SetPasswordScreen(),
    );
  }
}

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

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
              'Set password',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2A2A2A),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Set your password',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA0A0A0),
              ),
            ),
            const SizedBox(height: 32),
            const PasswordInputField(
              hintText: 'Enter Your Password',
            ),
            const SizedBox(height: 16),
            const PasswordInputField(
              hintText: 'Confirm Password',
            ),
            const SizedBox(height: 16),
            const Text(
              'At least 1 number or a special character',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFFA6A6A6),
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
                onPressed: () {},
                child: const Text(
                  'Register',
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

class PasswordInputField extends StatelessWidget {
  final String hintText;

  const PasswordInputField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFFD0D0D0),
        ),
        suffixIcon: Icon(Icons.visibility_off, color: Colors.grey[600]),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFD0D0D0)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF1D1AD8)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
