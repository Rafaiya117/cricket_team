import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:circket/app_state/app_state.dart';

class PointTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (context, appState, _) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(appState.matchdetails.length, (index) {
              var details = appState.matchdetails[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      details.group_name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DataTable(
                    columnSpacing: 45,
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Color(0xFFDFE0FF),
                    ),
                    border: TableBorder(
                      bottom: BorderSide(color: Colors.black, width: 2),
                    ),
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Team',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'M',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'W',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'L',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'PT',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'NRR',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                    rows: details.teams.map((teamDetail) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(
                              teamDetail.team == "United State of America"
                                  ? "USA"
                                  : teamDetail.team == "Papua New Guinea"
                                      ? "PNG"
                                      : teamDetail.team.length > 2
                                          ? teamDetail.team.substring(0, 3)
                                          : teamDetail.team,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataCell(Text(teamDetail.match.toString(),
                              style: TextStyle(fontSize: 12))),
                          DataCell(Text(teamDetail.win.toString(),
                              style: TextStyle(fontSize: 12))),
                          DataCell(Text(teamDetail.loss.toString(),
                              style: TextStyle(fontSize: 12))),
                          DataCell(Text(teamDetail.point.toString(),
                              style: TextStyle(fontSize: 12))),
                          DataCell(Text(teamDetail.runrate.toString(),
                              style: TextStyle(fontSize: 12))),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
