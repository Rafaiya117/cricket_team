// ignore_for_file: prefer_const_constructors

import 'package:circket/app_state/app_state.dart';
import 'package:circket/page/teaminfo/teaminfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardTopBar extends StatelessWidget {
  //final ApplicationState appState = ApplicationState();
  final auth = FirebaseAuth.instance;
  String get name {
    if (auth.currentUser!.isAnonymous) {
      return 'Anonymous User';
    } else {
      return auth.currentUser!.displayName ?? 'Anonymous User';
    }
  }

  void viewTeamDetails(String teamName) {
    print('Viewing details of $teamName');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        color: Color(0xFF3C1E62), // Background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: CircleAvatar(
                    radius: 25,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/avater.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Text Widget
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        'Hi, ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        name.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Consumer<ApplicationState>(
                    builder: (context, appState, _) => Row(
                      children: appState.teamlist
                          .map(
                            (list) => TeamItem(
                              imagePath: 'assets/images/${list.teamimage}',
                              text: list.teamName == "United States of America"
                                  ? "USA"
                                  : list.teamName == "Papua New Guinea"
                                      ? "PNG"
                                      : list.teamName,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TeamInfoPage(
                                          teamName: list.teamName)),
                                );
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  // Add more TeamItem widgets as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  TeamItem({
    required this.imagePath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 4),
        child: Column(
          children: [
            CircleAvatar(
              radius: 15,
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 8,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: DashboardTopBar(),
//       ),
//     );
//   }
// }
