import 'package:bookshelf/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final List<Book> books = [];

getBooks() {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference cr = firestore.collection('books');

  cr.get().then((qs) {
    qs.docs.map((e) {
      print(e.id);
    });
  });
}
