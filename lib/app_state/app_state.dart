import 'package:circket/app_state/firebase_auth.dart';
import 'package:circket/firebase_options.dart';
import 'package:circket/model/audienceprediction.dart';
import 'package:circket/model/match.dart';
import 'package:circket/model/matchDetails.dart';
import 'package:circket/model/team.dart';
import 'package:circket/page/dashboard/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  late final FirebaseAuth _auth;
  late final FirebaseFirestore _firestore;
  late final FireAuth _fireAuth;

  List<Cricket_Match> _gamelist = [];
  List<Cricket_Match> get gamelist => _gamelist;

  List<Team> _teamlist = [];
  List<Team> get teamlist => _teamlist;

  List<AudiencePrediction>_gamepoint = [];
  List<AudiencePrediction> get gamepoint => _gamepoint;

  List<GroupDetails> _matchdetails = [];
  List<GroupDetails> get matchdetails => _matchdetails;

  User? _user;
  User? get user => _user;

  bool _isUserAnonymous = true;
  bool get isUserAnonymous => _isUserAnonymous;
  

  Future<void> init() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    _auth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
    _fireAuth = FireAuth();

    _auth.authStateChanges().listen((User? user) {
      _user = user;
      if (_user!= null) {
        if (_user!.isAnonymous) {
          _isUserAnonymous = true;
        } else {
          _isUserAnonymous = false;
        }
      } else {
        _isUserAnonymous = true;
      }
      notifyListeners();
    });
   // _fetchMatches();
   // _fetcteams();
   // _winnnerPoint();

    _fetchData<Cricket_Match>('cmatches', (data) => Cricket_Match.fromJson(data)).then((data) {
      _gamelist = data;
      notifyListeners();
    });

     _fetchData<Team>('teams', (data) => Team.fromJson(data)).then((data) {
      _teamlist = data;
      notifyListeners();
    });

     _fetchData<AudiencePrediction>('audiencePrediction', (data) => AudiencePrediction.fromJson(data)).then((data) {
      _gamepoint = data;
      notifyListeners();
    });

    _fetchData<GroupDetails>('groups', (data) => GroupDetails.fromJson(data)).then((data) {
      _matchdetails = data;
      //print(data.first.group_name);
      notifyListeners();
    });
 }

Future<List<T>> _fetchData<T>(String collectionName, T Function(Map<String, dynamic>) fromJson) async {
    final List<T> items = [];
    final snapshot = await _firestore.collection(collectionName).get();
    for (final doc in snapshot.docs) {
      items.add(fromJson(doc.data()));
    }
    return items;
  }
 

  Future<void> signUpWithEmailAndPassword(BuildContext context,String email,String password,String Name,) async {
    try {
      final User user = await _fireAuth.handleSignUp(email, password);
    await user.updateDisplayName(Name);
    await _firestore.collection("users").doc(user.uid).set({
      'firstName': Name.toLowerCase(),
      'email': email,
      'displayName':Name.toLowerCase(),
    });
    notifyListeners();
     Navigator.push(context,
       MaterialPageRoute(builder: (context) => DashboardPage()),);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Signup successful.'),
        ),
      );
      //  print("currrentUser ${_auth.currentUser!.uid}");
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The password provided is too weak.'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The account already exists for that email, please try to Login instead of Signup'),
          ),
        );
      }
    }catch (e) {
      print(e);
    }
  }
  Future<void> signInWithEmailAndPassword(BuildContext context,String email,String password) async {
    try {
       final userQuery = await _firestore.collection("users").where("email", isEqualTo: email).get();
      if(userQuery.docs.isNotEmpty){
       //print(userQuery.docs); 
      await _fireAuth.handleSignInEmail(email, password);
      notifyListeners();
      //print("currrentUser ${_auth.currentUser!.displayName}");
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful.'),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or password.'),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInAnonymously(BuildContext context) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print('Signed in anonymously with UID: ${userCredential.user!.uid}');
      _isUserAnonymous = true;
       Navigator.push(context,
       MaterialPageRoute(builder: (context) => DashboardPage()),);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('SignIn.'),
        ),
      );
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print('Failed to sign in anonymously: ${e.code}');
    }
  }

  Future<void> audiencePredictionGame(BuildContext context,String predictedTeam) async {

  final User? user = _auth.currentUser;

  // if (user == null) {
  //   print('No user is currently signed in.');
  //   return;
  // }

  final docRef = _firestore.collection('audiencePrediction').doc(user!.uid);

  final audiencePrediction = AudiencePrediction(
    id: user.uid,
    name: user.displayName ?? '', 
    email: user.email ?? '', 
    predictedTeam: predictedTeam,
  );
  await docRef.set(audiencePrediction.toJson());
  notifyListeners();
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Data Submitted'),
    ),
  );
} 
}
// bool _loggedIn = false;
// bool get loggedIn => _loggedIn;

// : subTitle2.length > 2 ? subTitle2.substring(0, 2)