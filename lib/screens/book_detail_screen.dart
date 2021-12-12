import 'package:bookshelf/constants/colors/theme_color.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen(this.id, {Key? key}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 300,
            color: foregroundLight,
          )
        ],
      ),
    );
  }
}
