import 'package:circket/page/teaminfo/teaminfo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomWidget extends StatelessWidget {
  final String firstImagePath;
  final String secondImagePath;
  final String title;
  final String subTitle1;
  final String subTitle2;
  final String date;
  final String time;
  final String amount;

  const CustomWidget({
    Key? key,
    required this.firstImagePath,
    required this.secondImagePath,
    required this.title,
    required this.subTitle1,
    required this.subTitle2,
    required this.date,
    required this.time,
    required this.amount,
  }) : super(key: key);

  void _navigateToTeamInfo(BuildContext context, String teamName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TeamInfoPage(teamName: teamName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        height: 215,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF3C1E62),
                  border: Border.all(
                    color: Color(0xFF3C1E62),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => _navigateToTeamInfo(context, subTitle1),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 242, 243, 240),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: firstImagePath.startsWith('http')
                                    ? Image.network(
                                        firstImagePath,
                                        height: 30,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        firstImagePath,
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                subTitle1 == "United States of America"
                                    ? "USA"
                                    : subTitle1 == "Papua New Guinea"
                                        ? "PNG"
                                        : subTitle1,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'VS',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => _navigateToTeamInfo(context, subTitle2),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 242, 243, 240),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: secondImagePath.startsWith('http')
                                    ? Image.network(
                                        secondImagePath,
                                        height: 30,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        secondImagePath,
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                subTitle2 == "United States of America"
                                    ? "USA"
                                    : subTitle1 == "Papua New Guinea"
                                        ? "PNG"
                                        : subTitle1,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.calendarAlt,
                        size: 14.0,
                        color: Color(0xFF898989),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF898989),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Container(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       const FaIcon(
                //         FontAwesomeIcons.clock,
                //         size: 14.0,
                //         color: Color(0xFF898989),
                //       ),
                //       const SizedBox(width: 5),
                //       Text(
                //         time,
                //         style: const TextStyle(
                //           fontSize: 12.0,
                //           color: Color(0xFF898989),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.clock,
                        size: 14.0,
                        color: Color(0xFF898989),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF898989),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     Container(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Row(
            //         children: [
            //           const FaIcon(
            //             FontAwesomeIcons.moneyBill,
            //             size: 14.0,
            //             color: Color(0xFF898989),
            //           ),
            //           const SizedBox(width: 5),
            //           Text(
            //             amount,
            //             style: const TextStyle(
            //               fontSize: 12.0,
            //               color: Color(0xFF898989),
            //             ),
            //           ),
            //           const SizedBox(
            //             width: 5,
            //             height: 5,
            //           ),
            //           Text(
            //             'Bets for to stay',
            //             style: const TextStyle(
            //               fontSize: 12.0,
            //               color: Color(0xFF898989),
            //             ),
            //             softWrap: true, // Add this line to enable line wrapping
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
