import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:taxigo/presentation/LogIn.dart'; // Ensure this path is correct
import 'package:taxigo/presentation/PhoneVerificationScreen.dart';
import 'package:taxigo/presentation/WelcomeScreen.dart';
import 'package:url_launcher/url_launcher.dart'; // Make sure to import this

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isChecked = false; // State to track the checkbox status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('./assets/angle-left.png'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            );
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
        color:
            const Color(0xFFFFFFFF), // Set the background color to white here
        child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20), // Adjusted padding for overall ListView
          children: [
            const SizedBox(height: 30), // Reduced space after the AppBar
            const Text('Sign up',
                style: TextStyle(
                    color: Color(0xFF2A2A2A),
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 30), // Adjust spacing to your liking
            _buildTextField(label: 'Name'),
            const SizedBox(height: 20),
            _buildTextField(label: 'Email'),
            const SizedBox(height: 20),
            _buildPhoneNumberField(),
            const SizedBox(height: 20),
            _buildDropdownField(label: 'Gender'),
            const SizedBox(height: 20),
            _buildAgreementText(),
            const SizedBox(height: 20),
            _buildSignUpButton(),
            const SizedBox(height: 20),
            _buildOrDivider(),
            const SizedBox(height: 20),
            _buildSocialSignUpOptions(),
            const SizedBox(height: 30),
            _buildAccountSignInOption(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label}) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        labelText: label,
        labelStyle:
            const TextStyle(fontFamily: 'Poppins', color: Color(0xFFD0D0D0)),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: 'Your mobile number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        labelStyle: const TextStyle(
          fontFamily: 'Poppins',
          color: Color(0xFFD0D0D0),
        ),
      ),
      initialCountryCode: 'US',
      onChanged: (phone) {
        print(phone.completeNumber);
      },
      onCountryChanged: (country) {
        print('Country changed to: ${country.name}');
      },
    );
  }

  Widget _buildDropdownField({required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD0D0D0)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle:
              const TextStyle(fontFamily: 'Poppins', color: Color(0xFFD0D0D0)),
          border: InputBorder.none,
        ),
        items: const <DropdownMenuItem<String>>[
          DropdownMenuItem<String>(
            value: 'Male',
            child: Text('Male'),
          ),
          DropdownMenuItem<String>(
            value: 'Female',
            child: Text('Female'),
          ),
        ],
        onChanged: (String? value) {},
      ),
    );
  }

  // Updated Agreement Text with dynamic checkbox
  Widget _buildAgreementText() {
    return Row(
      children: [
        Checkbox(
          value: _isChecked, // Checkbox state is controlled by _isChecked
          onChanged: (bool? newValue) {
            setState(() {
              _isChecked = newValue!; // Toggle checkbox state
            });
          },
          checkColor: Colors.white, // color of tick
          activeColor: Colors.green, // background color when checked
        ),
        const SizedBox(width: 10), // Gap between checkbox and text
        Expanded(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Color(0xFFB8B8B8), // General text color
              ),
              children: <TextSpan>[
                TextSpan(text: 'By signing up, you agree to the '),
                TextSpan(
                  text: 'Terms of service',
                  style: TextStyle(
                      color: Colors.yellow), // Yellow text for clickable link
                ),
                TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy policy',
                  style: TextStyle(
                      color: Colors.yellow), // Yellow text for clickable link
                ),
                TextSpan(text: '.'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      height: 54.0,
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
          // Navigate to Log In page
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PhoneVerificationScreen()),
          );
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // ignore: prefer_const_constructors
        SizedBox(
          width: 100, // Specify the width based on your layout needs
          child: Divider(
            color: Colors.grey, // You can change the color to match your design
            thickness: 1, // Adjust thickness of the line
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Or',
            style: TextStyle(
              color: Colors.grey, // Adjust text color to match your design
              fontWeight: FontWeight.bold, // Make text bold
            ),
          ),
        ),
        SizedBox(
          width: 100, // Specify the width based on your layout needs
          child: Divider(
            color: Colors.grey, // You can change the color to match your design
            thickness: 1, // Adjust thickness of the line
          ),
        ),
      ],
    );
  }

  Widget _buildAccountSignInOption(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const LoginPage()), // Make sure LoginPage is defined in your app
          );
        },
        child: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16, // Optional: Adjust the font size to fit your design
              color: Color(0xFF5A5A5A), // Default text color
            ),
            children: <TextSpan>[
              TextSpan(text: 'Already have an account? '),
              TextSpan(
                text: 'Sign in',
                style: TextStyle(
                    color: Color(0xFF1D1AD8)), // Blue color for 'Sign in'
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialSignUpOptions() {
    return SizedBox(
      width: 174,
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Gmail button
          GestureDetector(
            onTap: () async {
              const url = 'https://mail.google.com';
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Image.asset('assets/gmail.png'),
            ),
          ),

          // Facebook button
          GestureDetector(
            onTap: () async {
              const url = 'https://www.facebook.com';
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF18ACFE), Color(0xFF0163E0)],
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Image.asset('assets/facebook.png'),
            ),
          ),

          // Apple button
          GestureDetector(
            onTap: () async {
              const url = 'https://itunesconnect.apple.com';
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF121212),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Image.asset('assets/apple.png'),
            ),
          ),
        ],
      ),
    );
  }
}
