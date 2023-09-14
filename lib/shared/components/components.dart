

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icon_broken/icon_broken.dart';


void navigateTo(context , widget){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=> widget),
  );
}

void navigateAndFinish(context , widget){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context)=> widget),
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

PreferredSizeWidget defaultAppBar ({required BuildContext context,String? title,List<Widget>? actions}){
  return AppBar(
    leading: IconButton(
      icon:const Icon(IconBroken.Arrow___Left_2),
      onPressed: () {Navigator.pop(context);  },
    ),
    title: Text(title!),
    actions: actions!,
  );
}
