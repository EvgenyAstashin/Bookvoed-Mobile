import 'package:bookvoed/entity/book.dart';
import 'package:bookvoed/mvp/base_presenter.dart';
import 'package:bookvoed/network/books/books_api.dart';

import 'add_book_view.dart';

class AddBookPresenter extends BasePresenter<AddBookView> {

  BooksApi _api;
  Book _book;

  AddBookPresenter(AddBookView view, this._api, this._book) : super(view);

}