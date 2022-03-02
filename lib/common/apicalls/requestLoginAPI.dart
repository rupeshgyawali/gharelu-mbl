import 'package:flutter/material.dart';
import 'package:gharelu/common/functions/saveCurrentLogin.dart';
import 'package:gharelu/model/loginModel.dart';
import 'package:gharelu/resources.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<LoginModel> requestLoginAPI(
    BuildContext context, String username, String password) async {
  final url = loginUrl;
  Map<String, String> body = {
    'username': username,
    'password': password,
  };

  final response = await http.post(url, body: body);
  print(response.statusCode);
  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(responseJson);
    saveCurrentLogin(responseJson);
    Navigator.of(context).pushReplacementNamed('/home');
    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);
    print(responseJson);
    saveCurrentLogin(responseJson);
    return null;
  }
}
