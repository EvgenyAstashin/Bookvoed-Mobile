import 'dart:convert';

import 'package:bookvoed/entity/book.dart';
import 'package:bookvoed/network/books/books_api.dart';
import 'package:bookvoed/network/http_client.dart';

class BooksApiImpl implements BooksApi {

  @override
  Future<List<Book>> getMyBooks() async {
    var response = await HttpClient.get('/books/my');
    if(response.statusCode == 200)
      return Book.parseList(json.decode(response.body));
    else
      throw Exception();
  }

  @override
  Future<Book> getBook(String isbn) async {
      var response = await HttpClient.get('/books/$isbn');
      if (response.statusCode == 200)
        return Book.fromJson(json.decode(response.body));
      else
        throw Exception('Failed to load books');
  }
}