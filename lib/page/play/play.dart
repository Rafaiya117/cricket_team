import 'package:circket/app_state/app_state.dart';
import 'package:circket/page/play/widgets/pointlist.dart';
import 'package:flutter/material.dart';
import 'package:circket/components/menu/bottom.dart';
import 'package:circket/page/play/widgets/topbar.dart';
import 'package:provider/provider.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PlayerTopBar(), // Assuming PlayerTopBar is correctly implemented and imported
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Consumer<ApplicationState>(
                    builder: (context, appState, _) => Column(
                      children: appState.gamepoint
                          .where((point) =>
                              point.id == appState.user!.uid)
                          .map((point) => PointInfoWidget(
                                userImage: 'assets/images/avater.png',
                                userName: point.name,
                                userFlagImage: 'assets/images/bangladesh.png',
                                userRank: '#1',
                                userCoinCount: '0',
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 5),
                  // PointInfoWidget(
                  //   userImage: 'assets/images/userimage.jpg',
                  //   userName: 'John Doe',
                  //   userFlagImage: 'assets/images/bangladesh.png',
                  //   userRank: '#1',
                  //   userCoinCount: '500',
                  // ),
                  // SizedBox(height: 5),
                  // PointInfoWidget(
                  //   userImage: 'assets/images/userimage.jpg',
                  //   userName: 'John Doe',
                  //   userFlagImage: 'assets/images/bangladesh.png',
                  //   userRank: '#1',
                  //   userCoinCount: '500',
                  // ),
                  // SizedBox(height: 5),
                  // PointInfoWidget(
                  //   userImage: 'assets/images/userimage.jpg',
                  //   userName: 'John Doe',
                  //   userFlagImage: 'assets/images/bangladesh.png',
                  //   userRank: '#1',
                  //   userCoinCount: '500',
                  // ),
                  // SizedBox(height: 5),
                  // PointInfoWidget(
                  //   userImage: 'assets/images/userimage.jpg',
                  //   userName: 'John Doe',
                  //   userFlagImage: 'assets/images/bangladesh.png',
                  //   userRank: '#1',
                  //   userCoinCount: '500',
                  // ),
                  // SizedBox(height: 5),
                  // PointInfoWidget(
                  //   userImage: 'assets/images/userimage.jpg',
                  //   userName: 'John Doe',
                  //   userFlagImage: 'assets/images/bangladesh.png',
                  //   userRank: '#1',
                  //   userCoinCount: '500',
                  // ),
                  // SizedBox(height: 5),
                  // PointInfoWidget(
                  //   userImage: 'assets/images/userimage.jpg',
                  //   userName: 'John Doe',
                  //   userFlagImage: 'assets/images/bangladesh.png',
                  //   userRank: '#1',
                  //   userCoinCount: '500',
                  // ),
                  // SizedBox(height: 5),
                  // PointInfoWidget(
                  //   userImage: 'assets/images/userimage.jpg',
                  //   userName: 'John Doe',
                  //   userFlagImage: 'assets/images/bangladesh.png',
                  //   userRank: '#1',
                  //   userCoinCount: '500',
                  // ),
                ],
              ),
            ),
          ),
          CustomBottomNavigationBar(
            currentIndex: 2,
          ),
        ],
      ),
    );
  }
}
