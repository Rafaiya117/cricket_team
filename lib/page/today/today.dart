import 'package:circket/app_state/app_state.dart';
import 'package:circket/page/today/widgets/submit.dart';
import 'package:circket/page/today/widgets/today_play.dart';
import 'package:flutter/material.dart';
import 'package:circket/components/menu/bottom.dart';
import 'package:circket/components/menu/topmenu.dart';


class TodayPage extends StatefulWidget {
  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  final ApplicationState appState = ApplicationState();
  String? _selectedTeamName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTopBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 6),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Select Your Choice',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                   SizedBox(height: 5),
                  TodayPlayContainer (
                    title1: '1st Match',
                    title2: 'Bangabandhu National Stadium, Dhaka',
                    imagePath1: 'assets/images/England.png',
                    teamName1: 'England',
                    imagePath3: 'assets/images/new.jpg',
                    teamName3: 'New Zealand ',
                    startTime: 'Start at: 09 May, 03:20 PM',
                    onTeamSelected: (selectedTeam) {
                      setState(() {
                        _selectedTeamName = selectedTeam;
                      });
                    },
                  ),
                   SizedBox(height: 5),
                    SubmitButton(
                      onTap: () async {
                      // Handle button tap
                      print("selected team name${_selectedTeamName}");
                      await appState.audiencePredictionGame(context,_selectedTeamName!);
                    },
                  ),
                ],
              ),
            ),
          ),
          CustomBottomNavigationBar(currentIndex: 6,),
        ],
      ),
    );
  }
}
