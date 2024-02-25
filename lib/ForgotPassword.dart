
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/UiHelper.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    TextEditingController Emailcontroller= TextEditingController();
    forgotpassword(String email)async{
      if (email==" "){
        UiHelper.CustomAlertBox(context, "Enter mail here ");
      }
      else{
        FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      }
    }
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          UiHelper.CutomTextField(Emailcontroller, "Email", Icons.person_outline, false),
          SizedBox(height: 50,),
          UiHelper.CustomButton("Reset Password", () { 
            forgotpassword(Emailcontroller.text.toString());
          })

        ],
      ),
    );
  }
}
