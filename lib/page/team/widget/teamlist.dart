import 'dart:io' show Platform; // Import Platform to check the platform
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class TeamContainer extends StatelessWidget {
  final String imagePath;
  final String teamName;
  final VoidCallback onTap;

  TeamContainer({
    required this.imagePath,
    required this.teamName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String teamNameToDisplay = teamName;
    if (teamName == 'United States of America') {
      teamNameToDisplay = 'USA';
    } else if (teamName == 'Papua New Guinea') {
      teamNameToDisplay = 'PNG';
    }

 
    String platformPath;
    if (kIsWeb) {
      platformPath = imagePath; 
    } else if (Platform.isIOS) {
      platformPath = 'assets/images/${imagePath.split('/').last}'; 
    } else {
      platformPath = 'assets/images/${imagePath.split('/').last}'; 
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: SizedBox(
        width: 150, // Adjust the width as needed
        height: 140,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color(0xFFDFDFDF)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  platformPath,
                  height: 60,
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    teamNameToDisplay,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'RobotoSlab',
                    ),
                  ),
                ),
                SizedBox(height: 8), // Add spacing below the text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
