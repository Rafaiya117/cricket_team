import 'package:circket/page/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:circket/page/dashboard/dashboard.dart';
import 'package:circket/page/match/match.dart';
import 'package:circket/page/play/play.dart';
import 'package:circket/page/point/point.dart';
import 'package:circket/page/team/team.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  CustomBottomNavigationBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // color: Color.fromARGB(203, 218, 213, 213),
        color: Colors.grey[100],
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMenuItem(
                FontAwesomeIcons.home,
                'Home',
                currentIndex == 0,
                () {
                  if (currentIndex != 0) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  }
                },
              ),
              _buildMenuItem(
                FontAwesomeIcons.users,
                'Teams',
                currentIndex == 1,
                () {
                  if (currentIndex != 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TeamPage()),
                    );
                  }
                },
              ),
              _buildMenuItem(
                FontAwesomeIcons.play,
                'Play',
                currentIndex == 2,
                () async {
                  if (currentIndex != 2) {
                    if (FirebaseAuth.instance.currentUser != null &&
                        FirebaseAuth.instance.currentUser!.isAnonymous) {
                      // User is anonymously signed in, redirect to login page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PlayPage()),
                      );
                    }
                  }
                },
              ),
              _buildMenuItem(
                FontAwesomeIcons.chartLine,
                'Point',
                currentIndex == 3,
                () {
                  if (currentIndex != 3) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PointPage()),
                    );
                  }
                },
              ),
              _buildMenuItem(
                FontAwesomeIcons.list,
                'Match',
                currentIndex == 4,
                () {
                  if (currentIndex != 4) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MatchPage()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String label,
    bool isSelected,
    Function onTap,
  ) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        child: Column(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Color(0xFF3C1E62) : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? Color(0xFF3C1E62) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
