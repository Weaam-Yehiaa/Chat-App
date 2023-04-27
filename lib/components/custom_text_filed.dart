import 'package:flutter/material.dart';

class CustomFormTextFiled extends StatelessWidget {
  CustomFormTextFiled({this.onChanged,this.hintText,this.obscureText=false});

  String? hintText;
  Function(String)? onChanged;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(  //TextFormField instead of TextField cause of using Form
      obscureText: obscureText!,
      validator: (value){
        if(value!.isEmpty)
          {
            return 'field is required';
          }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder:OutlineInputBorder(
          borderSide:BorderSide(
            color: Color(0xffb772764),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),

      ),
    );
  }
}
