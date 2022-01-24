import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(

  buttonTheme: const ButtonThemeData(buttonColor: Colors.blue),
  iconTheme: const IconThemeData(color: Colors.black),
  textTheme: const TextTheme(bodyText2: TextStyle (color:
  Colors.black
  ),),
  appBarTheme:  const AppBarTheme(
    backgroundColor: defaultColor,
  titleSpacing: 20.0,
    elevation: 20,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.white70,
    statusBarIconBrightness: Brightness.dark,
  ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed

  ),
  fontFamily: 'EncryptionFont',
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
);



ThemeData darkTheme = ThemeData(


  buttonTheme: const ButtonThemeData(buttonColor: Colors.blueGrey),
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: const TextTheme(bodyText2: TextStyle (color:
  Colors.white
  ),),
  fontFamily: 'EncryptionFont',
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.grey.shade900,
  appBarTheme:  AppBarTheme(
    backgroundColor: Colors.grey.shade800,
    elevation: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey.shade800,
      statusBarIconBrightness: Brightness.light,
    )
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed

  ),


);


//HexColor(''),