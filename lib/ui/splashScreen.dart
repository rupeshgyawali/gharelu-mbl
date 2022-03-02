import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  countDownTime() async {
    var _duration = Duration(
      seconds: 2,
    );
    return Timer(_duration, () async {
      SystemChannels.textInput.invokeMethod('TextInput.hide');

      SharedPreferences preferences = await SharedPreferences.getInstance();

      var token = preferences.getString("LastToken");
      if (token != null) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    countDownTime();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.greenAccent,
      child: Center(
        child: Text(
          'Gharelu',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
