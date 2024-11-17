import 'package:flutter/material.dart';

class CustomMatchContainer extends StatelessWidget {
  final String title1;
  final String title2;
  final String imagePath1;
  final String country1;
  final String country2;

  final String imagePath2;
  
  final String startTime;

  CustomMatchContainer({
    required this.title1,
    required this.title2,
    required this.imagePath1,
    
    required this.imagePath2,
    
    required this.startTime,
     required this.country1,
    required this.country2,
  });

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
                      title1,
                      style: TextStyle(color: Colors.grey[800], fontSize: 12),
                    ),


              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTeamColumn(imagePath1),
                  SizedBox(width: 10,),
                  Column(
                    children: [
                            Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Padding(
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
                   SizedBox(width: 10,),
                  _buildTeamColumn(imagePath2),
                ],
              ),
               _buildCountryRow(country1, country2),
              Center(
                child: Text(
                  startTime,
                  style: TextStyle(color: Colors.grey[800], fontSize: 12),
                ),
              ),
              Center(
                child:Text(
                      title2,
                      style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.bold),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamColumn(String imagePath) {
  return Column(
    children: [
      // Check if imagePath starts with "http" or "https" (indicating a URL)
      if (imagePath.startsWith("http"))
        Image.network(
          imagePath,
          height: 50,
          width: 50,
          
        )
      else
        Image.asset(
          "assets/images/flag.png",
          height: 50,
          width: 50,
        ),
      // Padding(padding: EdgeInsets.only(right: 0),
      // child:Text(
      //   teamName,
      //   style: TextStyle(color: Colors.grey[800], fontSize: 12),
      // ),
      
      // )
      
    ],
  );
}
 Widget _buildCountryRow(String country1, String country2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text( country1 == "United States of America"
          ? "USA": country1 == "Papua New Guinea"? "PNG"
            : country1, style: TextStyle(color: Colors.grey[800], fontSize: 12)),
       
        Text( country2 == "United States of America"? "USA"
          : country2 == "Papua New Guinea"? "PNG": country2, style: TextStyle(color: Colors.grey[800], fontSize: 12)),
      ],
    );
  }
}
