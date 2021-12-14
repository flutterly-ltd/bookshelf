import 'package:bookshelf/constants/categories.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.popAndPushNamed(context, "/");
              },
              child: Text(
                "Book Shelf",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const Divider(),
            Text(
              "Categories",
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: category.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.popAndPushNamed(context, "/category",
                              arguments: e);
                        },
                        child: Text(
                          e,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      const Divider()
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    ));
  }
}
