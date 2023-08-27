import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/shared/constance/constance.dart';

ThemeData LightTheme = ThemeData(
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
     unselectedItemColor: Colors.grey,
    selectedItemColor: primaryColore,
    elevation: 20.0,
    type: BottomNavigationBarType.fixed,
  ) ,
  primarySwatch: primaryColore,
  scaffoldBackgroundColor: Colors.white,//HexColor('333739') ,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor:  Colors.black,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor:Colors.white ,
    elevation: 0,
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold
    ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    )
),
);