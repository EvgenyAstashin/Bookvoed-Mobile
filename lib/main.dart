import 'package:bookvoed/add_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'book_info.dart';
import 'models/books_respons.dart';
import 'network.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookvoed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ProgressDialog _progressDialog;

  @override
  void initState() {
    super.initState();
    _progressDialog = ProgressDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBookPressed,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addBookPressed() {
    _barcodeReaderPressed();
  }

  void _barcodeReaderPressed() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", false, ScanMode.BARCODE);

    _loadBookInfo(barcodeScanRes);
  }

  void _loadBookInfo(String isbn) async {
    _progressDialog.show();
    var result = await getBook(isbn);
    _progressDialog.hide();
    _openBookInfo(result);
  }

  void _openBookInfo(BooksResponse response) {
    if(response.totalItems > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookInfo(response.items[0])),
      );
    }
  }
}
