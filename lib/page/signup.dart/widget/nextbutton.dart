// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class NextButton extends StatelessWidget {

  final Function()?onTap;
  const NextButton({
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
          color: Color(0xFFff6438),
          borderRadius: BorderRadius.circular(8),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        child:Column(children: [
           const Center(
          child: Text(
            'Sign Up',
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
