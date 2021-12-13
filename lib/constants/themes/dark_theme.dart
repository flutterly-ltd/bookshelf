import 'package:bookshelf/constants/colors/theme_color.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundLight,
    backgroundColor: Colors.white,
    drawerTheme: drawerDarkTheme,
    appBarTheme: appbarDarkTheme);

AppBarTheme appbarDarkTheme = AppBarTheme(
    backgroundColor: backgroundLight,
    elevation: 0,
    iconTheme: const IconThemeData(color: Color(0xff2c1810)),
    titleTextStyle:
        const TextStyle(color: Color(0xff2c1810), fontWeight: FontWeight.bold));

DrawerThemeData drawerDarkTheme =
    DrawerThemeData(backgroundColor: backgroundLight);
