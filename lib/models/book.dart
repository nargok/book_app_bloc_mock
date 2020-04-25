class BookModel {
  String title;
  String author;
  List<_Book> list = [];

  List _items;

  BookModel.fromJson(Map<String, dynamic> parsedJson) {
    List<_Book> temp = [];
    for (int i = 0; i < parsedJson['items'].length; i++) {
      _Book item = _Book(parsedJson['items'][i]['volumeInfo']);
      temp.add(item);
    }
    _items = temp;
  }

  List<_Book> get items => _items;
}

class _Book {
  String _title;
//  String _author; // todo authorsがないitemへの対応

  _Book(result) {
    _title = result['title'];
//    _author = result['authors'][0];
  }

  String get title => _title;
//  String get author => _author;

}