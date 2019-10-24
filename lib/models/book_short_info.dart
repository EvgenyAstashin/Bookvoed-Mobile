import 'dart:convert';

class BookShortInfo {
  int id;
  String title;
  String isbn;

  BookShortInfo({
    this.id,
    this.title,
    this.isbn
  });

  factory BookShortInfo.fromJson(Map<String, dynamic> json) => new BookShortInfo(
    id: json["id"],
      title: json["title"],
      isbn: json["isbn"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "isbn": isbn
  };
}