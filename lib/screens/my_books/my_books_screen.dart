import 'package:bookvoed/entity/book.dart';
import 'package:bookvoed/network/books/books_api_impl.dart';
import 'package:bookvoed/screens/my_books/my_books_presenter.dart';
import 'package:bookvoed/screens/my_books/my_books_view.dart';
import 'package:flutter/material.dart';

class MyBooksScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyBooksState();
  }
}

class MyBooksState extends State<MyBooksScreen> implements MyBooksView {

  MyBooksPresenter _presenter;
  Widget _body;

  @override
  void initState() {
    _body = _buildNothingToShow();
    _presenter = MyBooksPresenter(this, BooksApiImpl());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  @override
  void showProgress() {
    setState(() {
      _body = _buildProgress();
    });
  }

  @override
  void showError(String message) {

  }

  @override
  void showBooks(List<Book> books) {
    setState(() {
      _body = _buildBooksList(books);
    });
  }

  @override
  void showNothing() {
    setState(() {
      _body = _buildNothingToShow();
    });
  }

  Widget _buildNothingToShow() {
    return Center(
      child: Text('Nothing to show'),
    );
  }

  Widget _buildProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildBooksList(List<Book> books) {
    return Center(
      child: Text('List of books'),
    );
  }
}