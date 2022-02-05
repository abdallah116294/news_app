
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeServices {

  static ThemeData lightTheme(BuildContext context){
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        titleSpacing: 3,
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        ),
        titleTextStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
      ),
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.deepOrange,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black
        ),
        bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black
        ),
      ),
      dividerColor: Colors.grey,

    );
  }

  static ThemeData darkTheme(BuildContext context){
    return ThemeData(
      scaffoldBackgroundColor: HexColor('333739'),
      appBarTheme: AppBarTheme(
        titleSpacing: 3,
        elevation: 0,
        backgroundColor: HexColor('333739'),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: const TextStyle(color: Colors.white70,fontSize: 25,fontWeight: FontWeight.bold),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        backgroundColor: HexColor('333739'),
      ),
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white70),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.deepOrange,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white70
        ),
        bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white70
        ),
      ),
      dividerColor: Colors.grey,

    );
  }













}