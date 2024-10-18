import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        resizeToAvoidBottomInset:
            true, // This will allow the view to resize when the keyboard appears
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
        body: const SingleChildScrollView(
          // Wrap body with SingleChildScrollView
          child: ProfileBody(),
        ),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 30),
          ProfileAvatar(),
          SizedBox(height: 20),
          InputField(hintText: "Full Name"),
          PhoneNumberField(),
          InputField(hintText: "Email"),
          InputField(hintText: "Street"),
          DropdownField(
              hintText: "City", items: ['New York', 'Los Angeles', 'Chicago']),
          DropdownField(
              hintText: "District",
              items: ['District 1', 'District 2', 'District 3']),
          SizedBox(height: 20),
          ActionButtons(), // Ensure buttons remain accessible
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey[300],
        ),
        const Positioned(
          bottom: 0,
          right: 20,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xFF1D1AD8),
            child: Icon(Icons.camera_alt, color: Colors.white, size: 15),
          ),
        ),
      ],
    );
  }
}

class InputField extends StatelessWidget {
  final String hintText;

  const InputField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        style: const TextStyle(color: Color(0xFFD0D0D0)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFD0D0D0)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

class DropdownField extends StatelessWidget {
  final String hintText;
  final List<String> items;

  const DropdownField({Key? key, required this.hintText, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFD0D0D0)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(color: Color(0xFFD0D0D0)),
            ),
          );
        }).toList(),
        onChanged: (value) {},
      ),
    );
  }
}

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: 'Your mobile number',
        labelStyle: const TextStyle(color: Color(0xFFD0D0D0)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      initialCountryCode: 'US',
      style: const TextStyle(color: Color(0xFFD0D0D0)),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Ensure buttons are in SafeArea
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFF1D1AD8)),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            onPressed: () {},
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF414141),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D1AD8),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
