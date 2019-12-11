import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../book_info.dart';
import '../../entity/book.dart';
import '../../network.dart';

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
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  _createDrawerItem(icon: Icons.library_books, text: 'Мои книги', onTap: (){_hideDrawer();}),
                  _createDrawerItem(icon: Icons.local_library, text: 'Сейчас читаю', onTap: (){_hideDrawer();}),
                  _createDrawerItem(icon: Icons.settings, text: 'Настройки', onTap: (){_hideDrawer();}),
                  Divider(thickness: 1.0, indent: 10, endIndent: 10,),
                  Padding(
                    padding: EdgeInsets.only(left: 100, right: 100),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  ListTile(
                    title: Center(child: Text('version: 0.0.1')),
                    onTap: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _barcodeReaderPressed,
        child: Icon(Icons.add),
      ),
    );
  }

  void _barcodeReaderPressed() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", false, ScanMode.BARCODE);
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  void _hideDrawer() {
    Navigator.pop(context);
  }
}
