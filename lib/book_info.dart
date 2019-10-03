import 'package:flutter/material.dart';

import 'models/book.dart';

class BookInfo extends StatelessWidget {
  Book _book;

  BookInfo(Book book) {
    _book = book;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_book.volumeInfo.title),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    List<Widget> widgets = List();
    widgets.add(_getTitle());
    if (_book.volumeInfo.imageLinks != null) widgets.add(_getImage());
    widgets.add(_getSpannedText("Автор: ", _getAuthors()));
    widgets.add(_getSpannedText("Описание: ", _book.volumeInfo.description));
    widgets.add(_getSpannedText("Издатель: ", _book.volumeInfo.publisher));
    widgets.add(_getSpannedText("Страниц: ", _book.volumeInfo.pageCount.toString()));
    widgets.add(_getSpannedText("Год: ", _book.volumeInfo.publishedDate));
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: widgets));
  }

  Widget _getTitle() {
    return Text(_book.volumeInfo.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  Widget _getImage() {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Image.network(_book.volumeInfo.imageLinks.smallThumbnail));
  }

  String _getAuthors() {
    String result = "";
    for(String author in _book.volumeInfo.authors) {
      result += author;
      if(_book.volumeInfo.authors.last != author) {
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
}
