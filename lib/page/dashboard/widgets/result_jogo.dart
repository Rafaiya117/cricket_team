import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultCustomWidget extends StatelessWidget {
  final String firstImagePath;
  final String secondImagePath;
  final String title;
  final String subTitle1;
  final String subTitle2;
  final String subTitle3;
  final String subTitle4;
  final String date;

  const ResultCustomWidget({
    Key? key,
    required this.firstImagePath,
    required this.secondImagePath,
    required this.title,
    required this.subTitle1,
    required this.subTitle2,
    required this.subTitle3,
    required this.subTitle4,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width *
                            0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   color: Colors.grey, // Border color
          //   width: 1.0, // Border width
          // ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   decoration: const BoxDecoration(
            //     border: Border(
            //       bottom: BorderSide(
            //         color: Color(0xFF3C1E62),
            //         width: 3.0,
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.black,
                  color: Color(0xFF3C1E62),
                  border: Border.all(
                    // color: Colors.black,
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
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 237, 241, 237),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // child: Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 10, vertical: 10),
                        //   child: Image.asset(
                        //     firstImagePath,
                        //     width: 50,
                        //     height: 30,
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
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
                                  width: 50,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subTitle1,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subTitle3,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
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
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 230, 236, 230),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Image.asset(
                            secondImagePath,
                            width: 50,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subTitle2,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subTitle4,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
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
            Center(
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.calendarAlt,
                      size: 14.0,
                      color: Color(0xFF898989),
                    ),
                    SizedBox(width: 5),
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
            ),
          ],
        ),
      ),
    );
  }
}
