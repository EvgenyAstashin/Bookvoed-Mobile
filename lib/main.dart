import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'book_info.dart';
import 'entity/book.dart';
import 'network.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

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
        title: Text("Мои книги"),
      ),
//      body: FutureBuilder<List<Book>>(
//        future: DBProvider.db.getAllBooks(),
//        builder: (BuildContext context, AsyncSnapshot<List<BookShortInfo>> snapshot) {
//          if (snapshot.hasData) {
//            return ListView.builder(
//              itemCount: snapshot.data.length,
//              itemBuilder: (BuildContext context, int index) {
//                BookShortInfo item = snapshot.data[index];
//                return ListTile(
//                  title: Text(item.title)
//                );
//              },
//            );
//          } else {
//            return Center(child: CircularProgressIndicator());
//          }
//        },
//      ),
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
    _openBookInfo(result, isbn);
  }

  void _openBookInfo(Book book, String isbn) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookInfo(book, isbn)),
    );
    setState(() {

    });
  }
}