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
    return SizedBox(
      height: 350,
      width: MediaQuery.of(context).size.width,
      //color: backgroundLight,
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

class _BookList extends StatelessWidget {
  _BookList({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;
  final List<Book> _categoryList = [];

  //Filter books list based on the specific category and add the books to the category list

  _getCategoryBooks() {
    for (var element in books) {
      if (element.bookCategory.contains(category)) {
        _categoryList.add(element);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _getCategoryBooks();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _SectionTitle(category),
              GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, "/category",
                      arguments: category);
                },
                child: Text(
                  "View all",
                  style: Theme.of(context).textTheme.caption,
                ),
              )
            ],
          ),
        )),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 50.0, left: 16, top: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/book-detail",
                        arguments: _categoryList[index].id);
                  },
                  child: BookView(
                    _categoryList[index].id,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

//-----------------------------------------------------------------------------------------------
//Category / Section title
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

//-----------------------------------------------------------------------------------------------
//Book shelf slab design
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

//-----------------------------------------------------------------------------------------------
//Top view of the book shelf slab
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
        decoration: BoxDecoration(
          color: (Theme.of(context).brightness == Brightness.light)
              ? shelfTopLight
              : shelfTopDark,
        ));
  }
}

//-----------------------------------------------------------------------------------------------
//Front view of the book shelf slab
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
          decoration: BoxDecoration(
              color: (Theme.of(context).brightness == Brightness.light)
                  ? shelfFrontLight
                  : shelfFrontDark,
              boxShadow: [
                if (Theme.of(context).brightness == Brightness.light)
                  BoxShadow(
                    blurRadius: 30,
                    color: Theme.of(context).shadowColor,
                    offset: const Offset(30, 25),
                  )
              ])),
    );
  }
}
