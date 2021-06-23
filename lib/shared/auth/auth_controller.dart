import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  User? _user;

  User get user => _user!;

  void setUser(BuildContext context, User? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void saveUser(User user) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('user', user.toJson());
    return;
  }

  void currentUser(BuildContext context) async {
    final preferences = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (preferences.containsKey('user')) {
      final user = preferences.get('user') as String;
      setUser(context, User.fromJson(user));
      return;
    }

    setUser(context, null);
  }
}
