
//import 'package:circket/page/dashboard/dashboard.dart';
import 'package:circket/page/login/login.dart';
//import 'package:circket/page/signup.dart/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: WelcomePage(),
  ));
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF3C1E62), // Set background color here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/images/C_player.jpg',
            //   width: 50,
            //   height: 80,
            //   fit: BoxFit.cover, // Ensure the image covers the specified area
            // ),
            Text(
              'World Cup 2024',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20), // Add spacing between text and dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 5,
                ),
                SizedBox(width: 20),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 5,
                ),
                SizedBox(width: 20),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
