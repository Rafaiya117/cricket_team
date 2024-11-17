import 'package:flutter/material.dart';

class PointInfoWidget extends StatelessWidget {
  final String userImage;
  final String userName;
  final String userFlagImage;
  final String userRank;
  final String userCoinCount;
  final Key? key; // Define key here

  const PointInfoWidget({
    required this.userImage,
    required this.userName,
    required this.userFlagImage,
    required this.userRank,
    required this.userCoinCount,
    this.key, // Use key here
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 70,
        color: const Color.fromARGB(255, 101, 55, 162),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          userRank,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                           color:Color(0xFFDFE0FF),
                          width: 3,
                        ), // Add green border
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          userImage,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Flag
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      child: Image.asset(
                        userFlagImage,
                        width: 20,
                        height: 15,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Text Widget
                  Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Row(
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/coin.png',
                      width: 50,
                      height: 45,
                    ),
                  ),
                  Text(
                    userCoinCount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
