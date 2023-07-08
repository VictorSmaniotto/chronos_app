import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Pages/login_page.dart';
import 'api_url.dart';

class Auth {
  static Future<bool> login(String email, String password) async {
    var response = await http.post(
      Uri.parse("${ApiUrl.baseUrl}/login"),
      body: {
        "email": email,
        "password": password,
      },
    );

    var usuario = jsonDecode(response.body);

    if (response.statusCode == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      preferences.setString('email', usuario['email']);
      preferences.setString('nome', usuario['nome']);
      preferences.setString('token', usuario['token']);
      // preferences.setString('foto', usuario['foto']);

      return true;
    }
    return false;
  }

  static Future<void> logout(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.clear();

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  static Future<void> testeLogin(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? token = preferences.getString('token');

    if (token == null) {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }
    }
  }
}
