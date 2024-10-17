import 'package:flutter/material.dart';
import 'package:taxigo/presentation/SignUp.dart';
// Ensure this path is correct
import 'package:url_launcher/url_launcher.dart'; // Make sure to import this

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back', style: TextStyle(color: Color(0xFF2A2A2A))),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2A2A2A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30),
            const Text('Sign In',
                style: TextStyle(
                    color: Color(0xFF2A2A2A),
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 100), // Adjust based on your design
            _buildTextField(
              controller: _emailController,
              label: 'Email or Phone Number',
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _passwordController,
              label: 'Enter Your Password',
              isPassword: true,
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  // Handle forget password tap
                },
                child: const Text(
                  'Forget password?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xFFF44336), // Red color for the text
                    height: 1.35,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            _buildSignInButton(), // Uses the SignInButton code with appropriate label
            const SizedBox(height: 20),
            _buildOrDivider(),
            const SizedBox(height: 20),
            _buildSocialSignUpOptions(), // Social sign-in options
            const SizedBox(height: 20),
            _buildAccountSignInOption(context), // Button to navigate to sign-up
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String label,
      bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: 'Poppins',
          color: Color(0xFFD0D0D0),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
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
          // Handle sign-in logic here, potentially verify credentials
        },
        child: const Text(
          'Sign In',
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
        SizedBox(width: 100, child: Divider(color: Colors.grey, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Or',
              style:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        ),
        SizedBox(width: 100, child: Divider(color: Colors.grey, thickness: 1)),
      ],
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

  Widget _buildAccountSignInOption(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const SignUpPage()), // Make sure SignUpPage is defined and imported
          );
        },
        child: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16, // Adjust the font size to fit your design
              color: Color(0xFF5A5A5A), // Default text color
            ),
            children: <TextSpan>[
              TextSpan(text: 'Don’t have an account? '),
              TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                    color: Color(0xFF1D1AD8)), // Blue color for 'Sign Up'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
