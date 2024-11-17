// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:circket/app_state/app_state.dart';
import 'package:circket/components/menu/bottom.dart';
import 'package:circket/model/match.dart';
import 'package:circket/page/dashboard/widgets/pro_jogo.dart';
import 'package:circket/page/dashboard/widgets/result_jogo.dart';
import 'package:circket/page/dashboard/widgets/topbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFE0FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Center(
          //   child: TeamTopBar(),
          // ),
          DashboardTopBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        // Adjust the width and height as needed
                        width: 349,
                        height: 139,
                        child: Stack(
                          children: [
                            // Image
                            Image.asset(
                              'assets/images/field.png', // Replace with your image path
                              width: 349, // Adjust the width as needed
                              height: 139, // Adjust the height as needed
                              fit: BoxFit.cover,
                            ),
                            // Overlay 1
                            Container(
                              width: 349,
                              height: 139,
                              color: Color(
                                  0x66000000), // Semi-transparent black color overlay
                            ),
                            // Overlay 2
                            Container(
                              width: 349,
                              height: 139,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: const [
                                    Color(0xFF492590), // Green color
                                    Color.fromARGB(34, 238, 241,
                                        238), // Semi-transparent white color
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                            ),
                            // Positioned text on top left
                            Positioned(
                              top: 0,
                              left: 30,
                              width: 155,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  'T20 World Cup 2024',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  'assets/images/player.png', // Replace with your image path
                                  width: 95,
                                  height: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'UPCOMING GAMES',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Colors.black,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ])),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Consumer<ApplicationState>(
                            builder: (context, appState, _) => Wrap(
                              spacing: 10,
                              children: appState.gamelist
                                  .whereType<Cricket_Match>()
                                  .where((element) =>
                                      element.status == "Not Started")
                                  .take(3)
                                  .map(
                                    (matches) => CustomWidget(
                                      firstImagePath: matches.flag0,
                                      secondImagePath: matches.flag1,
                                      title: 'Group ${matches.group}',
                                      subTitle1: matches.team0,
                                      subTitle2: matches.team1,
                                      date: matches.date,
                                      time: matches.time_GMT,
                                      amount: '300',
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'MATCH RESULTS',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Colors.black,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Consumer<ApplicationState>(
                            builder: (context, appState, _) => Wrap(
                              spacing: 10,
                              children: appState.gamelist
                                      .whereType<Cricket_Match>()
                                      .where((element) =>
                                          element.status == "Finished")
                                      .take(3)
                                      .map((matches) => ResultCustomWidget(
                                            firstImagePath: matches.flag0,
                                            secondImagePath: matches.flag1,
                                            title: 'Group ${matches.group}',
                                            subTitle1: matches.team0,
                                            subTitle2: matches.team1,
                                            date: matches.date, 
                                            subTitle3: '', 
                                            subTitle4: '',
                            
                                          ))
                                      .toList().isEmpty
                                    ? [Center(child:Text('No Matches Result Found'))]
                                  : [],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          CustomBottomNavigationBar(
            currentIndex: 0,
          ),
        ],
      ),
    );
  }
}
