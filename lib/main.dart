import 'package:flutter/material.dart';
import 'package:gharelu/ui/homeScreen.dart';
import 'package:gharelu/ui/loginScreen.dart';
import 'package:gharelu/ui/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gharelu',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
      home: 
        SplashScreen(),
    );
  }
}