 // Future<void> _fetchMatches() async {
  //   _firestore.collection('cmatches').snapshots().listen((snapshot) {
  //     // _gamelist.clear();
  //     for (final doc in snapshot.docs) {
  //       final matchData = doc.data();
  //       //print(">>>>${matchData}");
  //       _gamelist.add(Cricket_Match.fromJson(matchData));
  //     }
  //     notifyListeners();
  //   });
  // }

  // Future<void> _fetcteams() async {
  //   _firestore.collection('teams').snapshots().listen((snapshot) {
  //     // _gamelist.clear();
  //     for (final doc in snapshot.docs) {
  //       final teamData = doc.data();
  //       //print(teamData);
  //       _teamlist.add(Team.fromJson(teamData));
  //     }
  //     notifyListeners();
  //   });
  // }

  // Future<void> _winnnerPoint() async {
  //  if(_auth.currentUser!=null){
  //    _firestore.collection('audiencePrediction').snapshots().listen((snapshot) {
  //     // _gamelist.clear();
  //     for (final doc in snapshot.docs) {
  //       final user_point = doc.data();
  //       //print(teamData);
  //       _gamepoint.add(AudiencePrediction.fromJson(user_point));
  //     }
  //     notifyListeners();
  //   });
  //  }
  // }