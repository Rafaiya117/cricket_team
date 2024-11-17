// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:circket/app_state/app_state.dart';
import 'package:circket/page/point/widget/table.dart';
import 'package:circket/page/point/widget/topmenu.dart';

import 'package:flutter/material.dart';
import 'package:circket/components/menu/bottom.dart';
import 'package:provider/provider.dart';

class PointPage extends StatefulWidget {
  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PointTopBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // SizedBox(height: 5),
                  // Consumer<ApplicationState>(
                  //   builder: (context, appState, _) => Column(
                  //     children:
                  //         appState.matchdetails.asMap().entries.map((entry) {
                  //       int index = entry.key;
                  //       var details = entry.value;
                  //       return Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           Padding(
                  //             padding: EdgeInsets.symmetric(horizontal: 5),
                  //             child: Text(
                  //               details.group_name,
                  //               style: TextStyle(
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.grey,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),
                  PointTable(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          CustomBottomNavigationBar(
            currentIndex: 3,
          ),
        ],
      ),
    );
  }
}
