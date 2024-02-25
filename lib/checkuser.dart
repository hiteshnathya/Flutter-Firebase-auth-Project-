import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/LoginScreen.dart';
import 'package:login_signup/main.dart';

class CheckUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  checkUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return MyHomePage(title: "Home Page");
    } else {
      return LoginScreen();
    }
  }
}
