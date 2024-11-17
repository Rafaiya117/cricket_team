// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {

  final Function()?onTap;
  const SubmitButton({
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
          // color: Color(0xFF3D843E),
           color: Color(0xFF3C1E62),
          borderRadius: BorderRadius.circular(8),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        child:Column(children: [
           const Center(
          child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
         
        ),
        
        ],)
        
      ),
    );
  }
}
