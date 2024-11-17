import 'package:circket/app_state/app_state.dart';
import 'package:circket/components/menu/bottom.dart';
import 'package:circket/page/team/widget/teamlist.dart';
import 'package:circket/page/team/widget/topnav.dart';
import 'package:circket/page/teaminfo/teaminfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFE0FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TeamTopBar(),
          Expanded(
            child: SingleChildScrollView(
             
               child: Column(
                children: [
                  Container(
                    child: Consumer<ApplicationState>(
                      builder: (context, appState, _) {
                        List<Widget> rows = [];
                        for (int i = 0; i < appState.teamlist.length; i += 2) {
                          List<Widget> rowChildren = [
                            TeamContainer(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TeamInfoPage(
                                      teamName: appState.teamlist[i].teamName,
                                    ),
                                  ),
                                );
                              },
                              imagePath:'assets/images/${appState.teamlist[i].teamimage}',
                              teamName: appState.teamlist[i].teamName,
                            ),
                          ];
                          if (i + 1 < appState.teamlist.length) {
                            rowChildren.add(SizedBox(width: 1));
                            rowChildren.add(
                              TeamContainer(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TeamInfoPage(
                                        teamName:appState.teamlist[i + 1].teamName,
                                      ),
                                    ),
                                  );
                                },
                                imagePath:'assets/images/${appState.teamlist[i + 1].teamimage}',
                                teamName: appState.teamlist[i + 1].teamName,
                              ),
                            );
                          }
                          rows.add(Row(children: rowChildren));
                        }
                        return Column(children: rows);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              
             
            ),
          ),
          CustomBottomNavigationBar(
            currentIndex: 1,
          ),
        ],
      ),
    );
  }
}
