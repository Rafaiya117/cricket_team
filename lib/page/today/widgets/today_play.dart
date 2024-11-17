// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodayPlayContainer extends StatefulWidget {
  final String title1;
  final String title2;
  final String imagePath1;
  final String teamName1;
  final String imagePath3;
  final String teamName3;
  final String startTime;
  final Function onTeamSelected;
  
  TodayPlayContainer({
    required this.title1,
    required this.title2,
    required this.imagePath1,
    required this.teamName1,
    required this.imagePath3,
    required this.teamName3,
    required this.startTime,
    required this.onTeamSelected
  });

  @override
  _TodayPlayContainerState createState() => _TodayPlayContainerState();
}

class _TodayPlayContainerState extends State<TodayPlayContainer> {
  String? _selectedTeam;

  void _selectTeam(String teamName) {
    setState(() {
      _selectedTeam = teamName;
    });
    widget.onTeamSelected(teamName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFFDFDFDF)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  widget.title1,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTeamColumn(widget.imagePath1, widget.teamName1),
                  SizedBox(width: 0.3),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'VS',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildTeamColumn(widget.imagePath3, widget.teamName3),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  widget.startTime,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              Center(
                child: Text(
                  widget.title2,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamColumn(String imagePath, String teamName) {
  final isSelected = _selectedTeam == teamName;
  return GestureDetector(
    onTap: () => _selectTeam(teamName),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
          decoration: BoxDecoration(
            border: isSelected
                ? Border.all(color: Color(0xFF3C1E62), width: 2)
                : Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: 50,
                width: 50,
              ),
              SizedBox(height: 5),
              Text(
                teamName,
                style: TextStyle(
                  color: isSelected ? Color(0xFF3C1E62) : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (isSelected)
          Text(
            'Predicted Winner',
            style: TextStyle(
              color: Color(0xFF3C1E62),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    ),
  );
}

}
