import 'dart:convert';

import 'package:bookvoed/models/books_respons.dart';
import 'package:http/http.dart' as http;

Future<BooksResponse> getBook(String isbn) async {
  var uri = Uri.https('www.googleapis.com', '/books/v1/volumes',
      {"q": "isbn:" + isbn, "key": "AIzaSyDau66ejImbYqQznYhJ8qEF_tw440myAIQ"});
  var response = await http.get(uri);
  if (response.statusCode == 200)
    return BooksResponse.fromJson(json.decode(response.body));
  else
    throw Exception('Failed to load books');
}
