import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/ForgotPassword.dart';
import 'package:login_signup/SignUp.dart';
import 'package:login_signup/UiHelper.dart';
import 'package:login_signup/main.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Login(String emaill,String Passwordd)async{
    if(emaill=="" && Passwordd==""){
      return UiHelper.CustomAlertBox(context, "Enter Required Fields  ");
    }
    else{
      UserCredential? usercredential;
      try{
        usercredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: emaill, password: Passwordd).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "Login")));
        }
        );
      }
      on FirebaseAuthException catch(ex){
      return UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('Login Page'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,


          children: [
            UiHelper.CutomTextField(
                emailController, "Email", Icons.person, false),
            UiHelper.CutomTextField(
                passwordController, "Password", Icons.password, true),
            SizedBox(
              height: 30,
            ),
            UiHelper.CustomButton("   Login   ", () {
              Login(emailController.text.toString(), passwordController.text.toString());
            }),
            SizedBox(
              height: 150,
            ),
            InkWell(
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "New Account -",
                        style: TextStyle(color: Colors.purpleAccent)),
                    TextSpan(
                        text: "Sign up",
                        style: TextStyle(color: Colors.purpleAccent)),
                  ]))
                ],
              ),
            ),
            SizedBox(height: 30,),
            TextButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));

            }, child: Text("Reset password ",style: TextStyle(fontSize: 20),)),



          ],
        ),
      ),
    );
  }
}
