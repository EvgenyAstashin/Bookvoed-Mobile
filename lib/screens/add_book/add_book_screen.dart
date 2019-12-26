import 'package:bookvoed/entity/book.dart';
import 'package:bookvoed/network/books/books_api_impl.dart';
import 'package:bookvoed/screens/add_book/add_book_presenter.dart';
import 'package:bookvoed/screens/add_book/add_book_view.dart';
import 'package:flutter/material.dart';

class AddBookScreen extends StatefulWidget {

  final Book book;

  AddBookScreen(this.book);

  @override
  State<StatefulWidget> createState() {
    return AddBookState();
  }

}

class AddBookState extends State<AddBookScreen> implements AddBookView {

  AddBookPresenter _presenter;

  @override
  void initState() {
    _presenter = AddBookPresenter(this, BooksApiImpl(), widget.book);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}