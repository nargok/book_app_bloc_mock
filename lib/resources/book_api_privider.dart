import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import '../models/book.dart';

class BookApiProvider {
  Client client = Client();
  final _baseUrl = "http://example.com";
  
  Future<Book> fetchBooks(String searchText) async {
    Response response;
    response = await client.get("$_baseUrl/?search=$searchText");

    if (response.statusCode == 200) {
      return Book.fromJon(json.decode(response.body));
    } else {
      throw Exception('Falied to load api');
    }
  }
}