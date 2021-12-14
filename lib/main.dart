import 'package:bookshelf/constants/themes/dark_theme.dart';
import 'package:bookshelf/constants/themes/light_theme.dart';
import 'package:bookshelf/screens/book_detail_screen.dart';
import 'package:bookshelf/screens/book_shelf_screen.dart';
import 'package:bookshelf/screens/category_screen.dart';
import 'package:bookshelf/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Shelf',
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        //"/": (context) => SplashScreen(),
        "/": (context) => const BookShelfScreen(),
        "/book-detail": (context) => const BookDetailScreen(),
        "/category": (context) => CategoryScreen(),
      },
    );
  }
}
