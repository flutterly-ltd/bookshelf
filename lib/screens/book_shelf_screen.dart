import 'package:bookshelf/constants/categories.dart';
import 'package:bookshelf/widgets/book_shelf.dart';
import 'package:bookshelf/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class BookShelfScreen extends StatelessWidget {
  const BookShelfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //actions: const [UserAvatar()],
        title: const Text(
          "Book Shelf",
        ),
      ),
      drawer: const MainDrawer(),
      body: ListView.builder(
        itemCount: category.length,
        itemBuilder: (context, index) {
          return BookShelf(category[index]);
        },
      ),
    );
  }
}
