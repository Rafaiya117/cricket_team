import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordFieldOne extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordFieldOne({
    Key? key,
    required this.controller,
    required this.hintText,
    required bool obscureText,
  }) : super(key: key);

  @override
  _PasswordFieldOneState createState() => _PasswordFieldOneState();
}

class _PasswordFieldOneState extends State<PasswordFieldOne> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        controller: widget.controller,
        obscureText: obscureText,
        style: TextStyle(color: Color(0xFF3C1E62)),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
           borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
           borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Color(0xFF3C1E62)),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 2,vertical: 10),
            child:FaIcon(
              obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
              size: 20,
              color: Colors.black,
            ),
            
            
            )
          ),
        ),
      ),
    );
  }
}
