import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
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
  appBarTheme:const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor:  Colors.black,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor:Colors.white ,
    elevation: 0,
    titleTextStyle:  TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold
    ),
  ),
  textTheme:const  TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.3,
      color: Colors.black,
    )


),
);
ThemeData DarkTheme = ThemeData(
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
     unselectedItemColor: Colors.grey,
    selectedItemColor: primaryColore,
    elevation: 20.0,
    type: BottomNavigationBarType.fixed,
  ) ,
  primarySwatch: primaryColore,
  scaffoldBackgroundColor: HexColor('333739') ,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor:  HexColor('333739'),
    ),
    iconTheme:const IconThemeData(color: Colors.white),
    backgroundColor: HexColor('333739'),
    elevation: 0,
    titleTextStyle:const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      height: 1.3,

      color: Colors.white,
    )
),
);