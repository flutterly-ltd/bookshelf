import 'package:bookshelf/constants/colors/theme_color.dart';
import 'package:bookshelf/models/book_model.dart';
import 'package:bookshelf/repository/sample_content.dart';
import 'package:bookshelf/widgets/book_view.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({Key? key}) : super(key: key);
  static const routename = "/book-detail";

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)!.settings.arguments as int;
    Book book = books.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
          //actions: const [UserAvatar()],
          ),
      body: ListView(
        children: [
          Container(
            height: 300,
            color: (Theme.of(context).brightness == Brightness.light)
                ? foregroundLight
                : foregroundDark,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(height: 200, width: 130, child: BookView(id)),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.bookTitle,
                              style: Theme.of(context).textTheme.headline5,
                              maxLines: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  book.bookAuthor,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: book.bookCategory.map((e) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.popAndPushNamed(context, "/category",
                                  arguments: e);
                            },
                            child: Chip(
                                elevation: 0,
                                visualDensity: VisualDensity.compact,
                                label: Text(
                                  e,
                                  style: Theme.of(context).textTheme.caption,
                                )),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              book.bookContent,
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
