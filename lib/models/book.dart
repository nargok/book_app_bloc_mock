class BookModel {
  String title;
  String author;
  List<_Book> list = [];

  BookModel({});
}

class _Book {
  String title;
  String author;

  Book({this.title, this.author});
}