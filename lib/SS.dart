import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UiHelper.dart';

class ss extends StatefulWidget{
  @override
  State<ss> createState() => _ssState();
}

class _ssState extends State<ss> {
  @override
  Widget build(BuildContext context) {
    TextEditingController EmailController=TextEditingController();
    TextEditingController PasswordController=TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('lOGIN PAGE '),
      ),
     body: Container(
       height: double.infinity,
       width: double.infinity,
       color: Colors.black26,
       child: Column(
         children: [
           UiHelper.CutomTextField(EmailController, "text", Icons.ice_skating,false ),
           UiHelper.CutomTextField(EmailController, "text", Icons.ice_skating,false ),
           SizedBox(height: 30,),
           UiHelper.CustomButton("Login", () { })

         ],
       ),

     ),
    );
  }
}