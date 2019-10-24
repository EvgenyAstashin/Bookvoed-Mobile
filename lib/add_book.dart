import 'package:bookvoed/book_info.dart';
import 'package:bookvoed/models/books_respons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'network.dart';

class AddBookScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddBookState();
  }
}

class AddBookState extends State<AddBookScreen> {

  String _barcode = "";
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
        title: Text("kek"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(_barcode),
            RaisedButton(
              child: Text('Open Barcode scaner'),
              onPressed: () => _barcodeReaderPressed(context),
            )
          ],
        ),
      ),
    );
  }

  void _barcodeReaderPressed(BuildContext context) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", false, ScanMode.BARCODE);
    setState(() {
      _barcode = barcodeScanRes;
    });
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
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookInfo(response.items[0], _barcode)),
      );
    }
  }
}