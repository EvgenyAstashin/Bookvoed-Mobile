import 'package:flutter/material.dart';

import 'entity/book.dart';

class BookInfo extends StatelessWidget {
  Book _book;
  String _isbn;

  BookInfo(Book book, String isbn) {
    _book = book;
    _isbn = isbn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_book.title),
      ),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    List<Widget> widgets = List();
    widgets.add(_getTitle());
    if (_book.image != null && _book.image != "") widgets.add(_getImage());
    widgets.add(_getSpannedText("Автор: ", _getAuthors()));
    widgets.add(_getSpannedText("Описание: ", _book.description));
    widgets.add(_getSpannedText("Издатель: ", _book.publisher));
    widgets.add(
        _getSpannedText("Страниц: ", _book.pages.toString()));
    widgets.add(_getSpannedText("Год: ", _book.publishedDate));
    widgets.add(_getButton(context));
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: widgets));
  }

  Widget _getTitle() {
    return Text(_book.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  Widget _getImage() {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Image.network(_book.image)
    );
  }

  String _getAuthors() {
    String result = "";
    for (String author in _book.authors) {
      result += author;
      if (_book.authors.last != author) {
        result += ", ";
      }
    }
    return result;
  }

  Widget _getSpannedText(String title, String body) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: RichText(
            text: TextSpan(
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
              new TextSpan(
                  text: title,
                  style: new TextStyle(fontWeight: FontWeight.bold)),
              new TextSpan(text: body)
            ])));
  }

  Widget _getButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: RaisedButton(
            child: Text("Добавить в список"),
            onPressed: () {_saveBookShortInfoAndClose(context);},
          ),
        ));
  }

  _saveBookShortInfoAndClose(BuildContext context) async {
//    var book = BookShortInfo();
//    book.title = _book.volumeInfo.title;
//    book.isbn = _isbn;
//    await DBProvider.db.insertBook(book);
//    Navigator.pop(context);
  }
}
