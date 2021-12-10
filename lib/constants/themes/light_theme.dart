import 'package:bookshelf/constants/colors/theme_color.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundLight,
    backgroundColor: Colors.white,
    drawerTheme: drawerLightTheme,
    appBarTheme: appbarLightTheme);

AppBarTheme appbarLightTheme = AppBarTheme(
    backgroundColor: backgroundLight,
    elevation: 0,
    iconTheme: const IconThemeData(color: Color(0xff2c1810)),
    titleTextStyle: const TextStyle(color: Color(0xff2c1810)));

DrawerThemeData drawerLightTheme =
    DrawerThemeData(backgroundColor: backgroundLight);
