import 'package:bookvoed/entity/book.dart';

abstract class BooksApi {

  Future<List<Book>> getMyBooks();

  Future<Book> getBook(String isbn);
}