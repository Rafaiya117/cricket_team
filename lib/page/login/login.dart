// ignore_for_file: prefer_const_constructors
import 'package:circket/app_state/app_state.dart';
import 'package:circket/page/dashboard/dashboard.dart';
import 'package:circket/page/login/widget/loginbtn.dart';
import 'package:circket/page/login/widget/passwordfield.dart';
import 'package:circket/page/login/widget/textsignup.dart';
import 'package:circket/page/signup.dart/signup.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
 


// void main() {
//   runApp(LoginPage());
// }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
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
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors: [ Color.fromARGB(255, 182, 166, 204), Colors.white],
              //   ),
              // ),
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
                        'World Cup 2024',style: TextStyle(
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
                        "Login",
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
                        "Please login to continue using our app",
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Nunito Sans',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
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
                    padding: EdgeInsets.symmetric(horizontal: 18),
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
                   LoginButton(
                    onTap: () async{
                      //print("currrentUsersss ${appState.user!.displayName}");
                     await appState.signInWithEmailAndPassword(context, 
                     emailController.text, 
                     passwordController.text);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => DashboardPage()),
                      // );
                    },
                  ),
                  SizedBox(height: 20),
                   GestureDetector(
                    onTap: ()async {
                      await appState.signInAnonymously(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => DashboardPage()),
                      // );
                    },
                    //  onTap: () => context.go('/'),
                    child: Center(
                      child: Text(
                        "Anonymous Login",
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                          color:  Color(0xFF3C1E62)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Text(
                      "Don't have an account ?",
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
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    //  onTap: () => context.go('/'),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                          color:  Color(0xFF3C1E62)
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

