// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:circket/app_state/app_state.dart';
import 'package:circket/page/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayerTopBar extends StatelessWidget {
  //final ApplicationState appState = ApplicationState();
 final  user_name = FirebaseAuth.instance.currentUser!.displayName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      color: Color(0xFF3C1E62), // Background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the DashboardPage when the icon is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardPage()),
                        );
                      },
                      child: FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    SizedBox(width: 3),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Text(
                            '#44',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: Color(0xFFDFE0FF),
                              width: 3), // Add green border
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            'assets/images/userimage.jpg',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    ///flag
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Container(
                        child: Image.asset(
                          'assets/images/bangladesh.png',
                          width: 20,
                          height: 15,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Text Widget
                     Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: Row(
                        children: [
                          Text(
                            user_name?.toLowerCase()??'Olason',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 15),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/coin.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const Text(
                      '0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
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
