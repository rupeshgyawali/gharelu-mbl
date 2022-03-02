import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gharelu/common/apicalls/requestLoginAPI.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.greenAccent,
      child: SafeArea(
        child: Scaffold(
          body: Material(
            color: Colors.greenAccent,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
              child: ListView(
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Text(
                    'Username or Email',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  TextField(
                    controller: _usernameController,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        requestLoginAPI(context, _usernameController.text, _passwordController.text);
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
