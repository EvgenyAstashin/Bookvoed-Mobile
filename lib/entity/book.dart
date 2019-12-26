import 'dart:core';

class Book {
  String isbn;
  String title;
  String subtitle;
  String description;
  List<String> authors;
  int pages;
  String publisher;
  String publishedDate;
  String image;

  Book(this.isbn, this.title, this.subtitle, this.description, this.authors,
      this.pages, this.publisher, this.publishedDate, this.image);

  Book.fromJson(Map<String, dynamic> json) {
    isbn = json['isbn'];
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    authors = List<String>.from(json['authors']);
    pages = json['pages'];
    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbn'] = isbn;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['description'] = description;
    data['authors'] = authors;
    data['pages'] = pages;
    data['publisher'] = publisher;
    data['publishedDate'] = publishedDate;
    data['image'] = image;
    return data;
  }

  static List<Book> parseList(List<dynamic> books) {
    return books?.map((e) => e == null
        ? null
        : new Book.fromJson(e as Map<String, dynamic>))
        ?.toList();
  }
}
