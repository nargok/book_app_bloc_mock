import 'package:rxdart/rxdart.dart';

import '../models/book.dart';

class BookBloc {
  final _booksFetcher = PublishSubject<BookModel>();

  Stream<BookModel> get allBoos => _booksFetcher.stream;

  fetchAllBooks() async {

  }
}
