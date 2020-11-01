import 'package:flutter/material.dart';
import 'package:laundry_app/Screens/home.dart';
import 'Constant/Constant.dart';
import 'Screens/ProfilePage.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/signup.dart';
import 'Screens/login.dart';
import 'Screens/password.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laundry App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primaryColor: Colors.purple, primaryColorDark: Colors.indigo[900]),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        PROFILE: (BuildContext context) => new LoginPage(),
        '/signup': (BuildContext context) => new SignupPage(),
        '/password': (BuildContext context) => new PasswordPage(),
        '/home': (BuildContext context) => new Home(),
        '/profile': (BuildContext context) => new ProfilePage(),
      },
    );
  }
}
