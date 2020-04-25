import 'dart:async';
import '../models/book.dart';
import 'book_api_privider.dart';

class Repository {
  final bookApiProvider = BookApiProvider();

  Future<BookModel> fetchBooks(String title) =>
      bookApiProvider.fetchBooks(title);
}
