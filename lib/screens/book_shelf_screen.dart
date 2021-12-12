import 'package:bookshelf/constants/categories.dart';
import 'package:bookshelf/constants/colors/theme_color.dart';
import 'package:bookshelf/repository/sample_content.dart';
import 'package:bookshelf/widgets/book_shelf.dart';
import 'package:flutter/material.dart';

class BookShelfScreen extends StatelessWidget {
  const BookShelfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [UserAvatar()],
      ),
      drawer: const Drawer(),
      body: ListView.builder(
        itemCount: category.length,
        itemBuilder: (context, index) {
          return BookShelf(category[index], featured);
        },
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: foregroundLight,
      ),
    );
  }
}
