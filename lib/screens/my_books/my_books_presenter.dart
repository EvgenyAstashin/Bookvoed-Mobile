import 'package:bookvoed/mvp/base_presenter.dart';
import 'package:bookvoed/network/books/books_api.dart';
import 'package:bookvoed/screens/my_books/my_books_view.dart';

class MyBooksPresenter extends BasePresenter<MyBooksView> {

  BooksApi _api;

  MyBooksPresenter(MyBooksView view, this._api) : super(view) {
    loadMyBooks();
  }

  void loadMyBooks() {
    view.showProgress();
    _api.getMyBooks().then((books){
      if(books.length != 0)
        view.showBooks(books);
      else
        view.showNothing();
    }).catchError((error) {
      view.showError(error.toString());
    });
  }
}