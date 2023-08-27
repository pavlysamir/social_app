

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void NavigateTo(context , Widget){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=> Widget),
  );
}

void NavigateAndFinish(context , Widget){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context)=> Widget),
      (route) => false);
}

void showToast(
    {required String messege,
     required ColorStates colorToast,
    }
    ){
  Fluttertoast.showToast(
      msg: messege,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: shooseCloreToast(colorToast),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ColorStates{SUCCESS,ERROR,WARNING}

Color shooseCloreToast(ColorStates state)
{
  Color color;
  if(state == ColorStates.SUCCESS){
     color = Colors.green.withOpacity(0.8);
  }else  if(state == ColorStates.ERROR){
     color = Colors.red;
  }else  color = Colors.amber;

  return color;
}
