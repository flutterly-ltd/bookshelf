import 'package:bookshelf/constants/colors/theme_color.dart';
import 'package:flutter/material.dart';

class BookShelf extends StatelessWidget {
  const BookShelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      color: backgroundLight,
      child: Column(
        children: [
          Expanded(child: Container()),
          Container(
              // constraints: const BoxConstraints(maxHeight: 50),
              height: 30,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(color: shelfTopLight, boxShadow: const [])),
          const _BookShelfFront()
        ],
      ),
    );
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
