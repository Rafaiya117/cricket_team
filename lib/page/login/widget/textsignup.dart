import 'package:flutter/material.dart';

class MyTextFieldSignup extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;

  const MyTextFieldSignup({
    Key? key,
    required this.controller,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white, // Set the background color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
            borderSide: BorderSide.none, // Remove the border color
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
            borderSide: BorderSide.none, // Remove the border color
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
            borderSide: BorderSide.none, // Remove the border color
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 16), // Adjust content padding
        ),
      ),
    );
  }
}
