// ignore_for_file: prefer_const_constructors

import 'package:circket/app_state/app_state.dart';
import 'package:circket/page/dashboard/dashboard.dart';
import 'package:circket/page/login/login.dart';
import 'package:circket/page/signup.dart/widget/nextbutton.dart';
import 'package:circket/page/signup.dart/widget/passwordfield.dart';
import 'package:circket/page/signup.dart/widget/textsignup.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Assuming the path is correct

void main() {
  runApp(SignupPage());
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApplicationState appState = ApplicationState();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
    backgroundColor: Color(0xFFDFE0FF), 
      body: SingleChildScrollView(
        // width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(
          children: [
            Container(
              height: 200,
              child: Column(
                children: const [
                  SizedBox(height: 100),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text(
                        "Welcome to",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Nunito Sans',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text(
                        'World Cup 2024',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w900,
                          // fontFamily: 'Nunito Sans',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text(
                        "Sign Up Now",
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          // fontFamily: 'Nunito Sans',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text(
                        "Create your account with few easy steps",
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Nunito Sans',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: MyTextFieldSignup(
                      controller: nameController,
                      // hintText: 'Type your email',
                      obscureText: false,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: MyTextFieldSignup(
                      controller: emailController,
                      // hintText: 'Type your email',
                      obscureText: false,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: PasswordFieldOne(
                      controller: passwordController,
                      // hintText: 'Type your email',
                      obscureText: false, hintText: '',
                    ),
                  ),
                  SizedBox(height: 40),
                  // Consumer<ApplicationState>(
                  //   builder:(context, appState, _)=>
                    NextButton(
                    onTap: () async {
                       //await appState.signInAnonymously(context);
                        await appState.signUpWithEmailAndPassword(context,
                          emailController.text,
                          passwordController.text,
                          nameController.text,
                        );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => DashboardPage()),
                      // );
                    },
                  ),
                  //),
                  
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Already have an account?",
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    //  onTap: () => context.go('/'),
                    child: Center(
                      child: Text(
                        "Login",
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
