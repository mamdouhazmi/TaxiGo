import 'package:flutter/material.dart';
import 'package:taxigo/presentation/PhoneVerifyOTP.dart';

void main() {
  runApp(const ForgotPasswordPage());
}

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white, // Set background color to white
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Color(0xFF2A2A2A),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Select which contact details should we use to reset your password',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFFA0A0A0),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              ContactOption(
                iconAsset: './assets/phone.png',
                primaryText: 'Via SMS',
                secondaryText: '***** ***70',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhoneVerifyOTP(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ContactOption(
                iconAsset: './assets/email.png',
                primaryText: 'Via Email',
                secondaryText: '**** **** **** xyz@xyz.com',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhoneVerifyOTP(),
                    ),
                  );
                },
              ),
              const Spacer(),
              _buildContinueButton(), // Updated button
              const SizedBox(height: 10),
            ],
          ),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: SizedBox(
            height: 34,
          ),
        ),
      ),
    );
  }

  // This method replicates the style of the Sign Up button for the "Continue" button
  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 54.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1D1AD8),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
        onPressed: () {
          // Action for Continue button
        },
        child: const Text(
          'Continue',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ContactOption extends StatelessWidget {
  final String iconAsset;
  final String primaryText;
  final String secondaryText;
  final VoidCallback onPressed;

  const ContactOption({
    super.key,
    required this.iconAsset,
    required this.primaryText,
    required this.secondaryText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Trigger onPressed when the widget is tapped
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF1D1AD8)),
        ),
        child: Row(
          children: [
            Image.asset(
              iconAsset,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  primaryText,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFFB8B8B8),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  secondaryText,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF5A5A5A),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
