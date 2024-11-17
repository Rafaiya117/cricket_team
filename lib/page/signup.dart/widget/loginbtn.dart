// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class LoginButton extends StatelessWidget {

  final Function()?onTap;
  const LoginButton({
    super.key,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        child:Column(children: [
           const Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
               fontFamily: 'Nunito',
              fontSize: 16,
            ),
          ),
         
        ),
        
        ],)
        
      ),
    );
  }
}
