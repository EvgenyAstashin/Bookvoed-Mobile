import 'dart:convert';

import 'package:http/http.dart' as http;

import 'entity/book.dart';

Future<Book> getBook(String isbn) async {
  var uri = Uri.https('10.69.252.153:8080', '/books/v1/volumes');
  var response = await http.get(uri);
  if (response.statusCode == 200)
    return Book.fromJson(json.decode(response.body));
  else
    throw Exception('Failed to load books');
}
