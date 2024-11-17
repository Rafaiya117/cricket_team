import 'package:circket/app_state/app_state.dart';
import 'package:circket/components/menu/bottom.dart';
import 'package:circket/components/menu/topmenu.dart';
import 'package:circket/page/match/widgets/flag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchPage extends StatefulWidget {
  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  int currentIndex = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFE0FF), 
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTopBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Consumer<ApplicationState>(
                    builder: (context, appState, _) => Column(
                      children: appState.gamelist
                          .map((match) => CustomMatchContainer(
                                title1: match.matchName,
                                title2: match.venue,
                                imagePath1: match.flag0,
                                country1: match.team0,
                                imagePath2: match.flag1 ,
                                country2: match.team1,
                                startTime: match.date,
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomBottomNavigationBar(
            currentIndex: 4,
          ),
        ],
      ),
    );
  }
}
