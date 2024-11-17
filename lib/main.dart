
import 'package:circket/app_state/app_state.dart';
import 'package:circket/page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //color:Colors.black,
      debugShowCheckedModeBanner: false,
      // home:DashboardPage(),
      home:WelcomePage(),
      // home: SignupPage(),
    );
  }
}

