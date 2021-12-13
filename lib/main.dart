import 'package:bookshelf/constants/themes/dark_theme.dart';
import 'package:bookshelf/constants/themes/light_theme.dart';
import 'package:bookshelf/screens/book_detail_screen.dart';
import 'package:bookshelf/screens/book_shelf_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Shelf',
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        "/": (context) => const BookShelfScreen(),
        "/book-detail": (context) => const BookDetailScreen(),
      },
    );
  }
}
