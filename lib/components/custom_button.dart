import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({this.onTap,this.name}) ;

  String? name;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffb772764),
            borderRadius: BorderRadius.circular(8.0)
        ),
        width: double.infinity,
        height: 60.0,
        child:Center(
          child: Text(
           name!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),

          ),
        ),

      ),
    );
  }
}
