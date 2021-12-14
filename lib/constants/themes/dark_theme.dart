import 'package:bookshelf/constants/colors/theme_color.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundDark,
    backgroundColor: Colors.black,
    shadowColor: Colors.amber[600]!,
    drawerTheme: drawerDarkTheme,
    appBarTheme: appbarDarkTheme);

AppBarTheme appbarDarkTheme = AppBarTheme(
    backgroundColor: backgroundDark,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.blueGrey),
    titleTextStyle:
        const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold));

DrawerThemeData drawerDarkTheme =
    DrawerThemeData(backgroundColor: foregroundDark);
