import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import '../models/book.dart';

class BookApiProvider {
  Client client = Client();
  final _baseUrl = "http://example.com";
  
  Future<BookModel> fetchBooks(String searchText) async {
    Response response;
    response = await client.get("$_baseUrl/?search=$searchText");

    if (response.statusCode == 200) {
      return BookModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load api');
    }
  }
}