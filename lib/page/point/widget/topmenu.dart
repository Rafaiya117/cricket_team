import 'package:circket/page/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PointTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      color: Color(0xFF3C1E62), // Background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the DashboardPage when the icon is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  },
                  child: FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                SizedBox(width: 8), // Add spacing between icon and text
                Text(
              'World Cup 2024 Point Table',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
              ],
            ),
          ),
         
          SizedBox(height: 10),
         
        ],
      ),
    ), );
   
  }

  Widget _buildMenuItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () {
          // Add onPressed logic
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
