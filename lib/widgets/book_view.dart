import 'package:bookshelf/constants/colors/theme_color.dart';
import 'package:bookshelf/models/book_model.dart';
import 'package:bookshelf/repository/sample_content.dart';
import 'package:flutter/material.dart';

class BookView extends StatefulWidget {
  const BookView({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  late Book book;

  @override
  void initState() {
    super.initState();
    book = books.firstWhere((element) => element.id == widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
          color: foregroundLight,
          image: DecorationImage(
              image: NetworkImage(book.bookCover), fit: BoxFit.cover),
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: Colors.grey, offset: Offset(5, 0))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              book.bookTitle,
              style: const TextStyle(color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              book.bookAuthor,
              style: const TextStyle(color: Colors.white, fontSize: 8),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
