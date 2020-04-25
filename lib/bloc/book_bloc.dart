import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';
import '../models/book.dart';

class BookBloc {
  final _repository = Repository();
  final _booksFetcher = PublishSubject<BookModel>();

  Stream<BookModel> get allBooks => _booksFetcher.stream;

  fetchAllBooks(String text) async {
    BookModel bookModel = await _repository.fetchBooks(text);
    _booksFetcher.add(bookModel);
  }

  dispose() {
    _booksFetcher.close();
  }
}

final bloc = BookBloc();
