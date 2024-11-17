import 'package:circket/page/match/match.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:circket/page/dashboard/dashboard.dart';
import 'package:circket/page/today/today.dart';

class CustomTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        color: Color(0xFF3C1E62), // Background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
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
                    'Live Cricket Score',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribute space evenly
              children: [
                // _buildMenuItem('WORLD CUP', () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => DashboardPage()),
                //   );
                // }),
                _buildMenuItem('LIVE', () {}),
                _buildMenuItem('TODAY', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TodayPage()),
                  );
                }),
                _buildMenuItem('RECENT', () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
