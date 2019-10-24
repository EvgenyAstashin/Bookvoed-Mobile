import 'dart:io';

import 'package:bookvoed/models/book_short_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final String BOOK_TABLE = 'Book';

  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "Bookvoed.db";
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE " +
          BOOK_TABLE +
          " ("
              "id INTEGER PRIMARY KEY,"
              "title TEXT,"
              "isbn TEXT"
              ")");
    });
  }

  insertBook(BookShortInfo book) async {
    final db = await database;
    var res = await db.insert(BOOK_TABLE, book.toJson());
    return res;
  }

  Future<BookShortInfo> getBookByIsbn(String isbn) async {
    final db = await database;
    var res = await db.query(BOOK_TABLE, where: "isbn = ?", whereArgs: [isbn]);
    return res.isNotEmpty ? BookShortInfo.fromJson(res.first) : Null;
  }

  Future<List<BookShortInfo>> getAllBooks() async {
    final db = await database;
    var res = await db.query(BOOK_TABLE);
    List<BookShortInfo> list = res.isNotEmpty
        ? res.map((c) => BookShortInfo.fromJson(c)).toList()
        : [];
    return list;
  }

  deleteBook(String isbn) async {
    final db = await database;
    db.delete(BOOK_TABLE, where: "isbn = ?", whereArgs: [isbn]);
  }
}
