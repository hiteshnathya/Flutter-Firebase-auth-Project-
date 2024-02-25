import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/UiHelper.dart';
import 'package:login_signup/main.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp(String email, String password) async {
    if (email == " " && password == " ") {
      UiHelper.CustomAlertBox(context,"Enter Required Fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(title: " My Home Page ")));
        });
      } on FirebaseAuthException catch (ex) {
        return UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('SignUp PAGE '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UiHelper.CutomTextField(
              emailController, "Email", Icons.person, false),
          UiHelper.CutomTextField(
              passwordController, "Password", Icons.password, true),
          SizedBox(
            height: 30,
          ),
          UiHelper.CustomButton("Sign Up", () {
            signUp(emailController.text.toString(),
                passwordController.text.toString());
          })
        ],
      ),
    );
  }
}
