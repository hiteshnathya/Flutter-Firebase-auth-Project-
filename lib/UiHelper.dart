import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper {
  static CutomTextField(
      TextEditingController controller,
      String text, IconData ICONDATA,
      bool ToHide
      ){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        obscureText: ToHide,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(ICONDATA),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24)
          )
        ),
      ),
    );
  }



  static CustomButton(
      String textt,
      VoidCallback voidCallback

      ){
   return ElevatedButton(
        onPressed: (){
      voidCallback();
    }, child: Text(textt));
  }


  static CustomAlertBox (BuildContext context, String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(title:  Text(text),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Ok")),
      ],);
    });
  }
}