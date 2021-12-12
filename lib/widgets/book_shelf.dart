import 'package:bookshelf/constants/colors/theme_color.dart';
import 'package:bookshelf/models/book_model.dart';
import 'package:bookshelf/repository/sample_content.dart';
import 'package:bookshelf/widgets/book_view.dart';
import 'package:flutter/material.dart';

class BookShelf extends StatelessWidget {
  const BookShelf(this.category, {Key? key}) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width,
      color: backgroundLight,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          const _BookShelfSlab(),
          _BookList(
            category: category,
          )
        ],
      ),
    );
  }
}

class _BookList extends StatefulWidget {
  const _BookList({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;

  @override
  State<_BookList> createState() => _BookListState();
}

class _BookListState extends State<_BookList> {
  List<Book> categoryList = [];

  @override
  void initState() {
    super.initState();
    getCategotyBooks();
  }

  getCategotyBooks() {
    for (var element in books) {
      if (element.bookCategory.contains(widget.category)) {
        categoryList.add(element);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SafeArea(child: _SectionTitle(widget.category)),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 50.0, left: 16, top: 10),
                child: BookView(
                  id: categoryList[index].id,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(
    this.sectionTitle, {
    Key? key,
  }) : super(key: key);

  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 20),
      child: Text(
        sectionTitle,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

class _BookShelfSlab extends StatelessWidget {
  const _BookShelfSlab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [_BookShelfTop(), _BookShelfFront()],
    );
  }
}

class _BookShelfTop extends StatelessWidget {
  const _BookShelfTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // constraints: const BoxConstraints(maxHeight: 50),
        height: 30,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: shelfTopLight, boxShadow: const []));
  }
}

class _BookShelfFront extends StatelessWidget {
  const _BookShelfFront({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70.0),
      child: Container(
          // constraints: const BoxConstraints(maxHeight: 20),
          height: 20,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: shelfFrontLight, boxShadow: const [
            BoxShadow(
              blurRadius: 30,
              color: Colors.grey,
              offset: Offset(30, 25),
            )
          ])),
    );
  }
}
