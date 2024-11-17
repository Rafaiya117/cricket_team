import 'package:circket/app_state/app_state.dart';
import 'package:circket/components/menu/bottom.dart';
import 'package:circket/page/team/team.dart';


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TeamInfoPage extends StatefulWidget {
  final String teamName;

  TeamInfoPage({required this.teamName});

  @override
  _TeamInfoPageState createState() => _TeamInfoPageState();
}

class _TeamInfoPageState extends State<TeamInfoPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<ApplicationState>(context);
    final team = appState.teamlist.firstWhere((team) => team.teamName == widget.teamName);

    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: Color(0xFF3C1E62), // Background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the DashboardPage when the icon is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TeamPage()),
                    );
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                SizedBox(width: 8), // Add spacing between icon and text
                 Text(
                  '${widget.teamName}',
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
        ],
      ),
    ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Table(
                      border: TableBorder.symmetric(
                        outside: BorderSide.none,
                        inside: BorderSide.none,
                      ),
                      columnWidths: const <int, TableColumnWidth>{
                        0: FlexColumnWidth(0.5),
                        1: FlexColumnWidth(),
                      },
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFF3C1E62),
                                      width: 3.0,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'No',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFF3C1E62),
                                      width: 3.0,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Player Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ...team.players.asMap().entries.map((entry) {
                          int index = entry.key;
                          var player = entry.value;
                          return TableRow(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                child: Text((index + 1).toString()),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  player.name,
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 14,
                                    fontFamily: 'RobotoSlab',
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
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
