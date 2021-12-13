import 'package:bookshelf/models/book_model.dart';
import 'package:bookshelf/repository/sample_content.dart';
import 'package:bookshelf/widgets/book_view.dart';
import 'package:bookshelf/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  static const routename = "/category";
  final List<Book> _categoryList = [];

  _getCategoryBooks(String _category) {
    for (var element in books) {
      if (element.bookCategory.contains(_category)) {
        _categoryList.add(element);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String _category =
        ModalRoute.of(context)!.settings.arguments as String;
    if (_category.isEmpty) {
      Navigator.popAndPushNamed(context, "/");
    }
    _getCategoryBooks(_category);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Book Shelf"),
        ),
        drawer: const MainDrawer(),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _category,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _categoryList.map((e) {
                  return SizedBox(
                      height: 200,
                      width: 130,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/book-detail",
                                arguments: e.id);
                          },
                          child: BookView(e.id)));
                }).toList(),
              ),
            ),
          ],
        ));
  }
}
