import 'package:bookvoed/screens/login/login.dart';
import 'package:bookvoed/screens/main/main_presenter.dart';
import 'package:bookvoed/screens/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> implements MainView {
  MainPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = MainPresenter(this);
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
                  _createDrawerItem(
                      icon: Icons.library_books,
                      text: 'Мои книги',
                      onTap: () {
                        _hideDrawer();
                      }),
                  _createDrawerItem(
                      icon: Icons.local_library,
                      text: 'Сейчас читаю',
                      onTap: () {
                        _hideDrawer();
                      }),
                  _createDivider(),
                  _createDrawerItem(
                      icon: Icons.settings,
                      text: 'Настройки',
                      onTap: () {
                        _hideDrawer();
                      }),
                  _createDrawerItem(
                      icon: Icons.exit_to_app,
                      text: 'Выход',
                      onTap: () {
                        _hideDrawer();
                        _logout();
                      }),
                  _createDivider(),
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

  @override
  void openLoginScreen() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
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

  Widget _createDivider() {
    return Divider(
        thickness: 1.0,
        indent: 10,
        endIndent: 10,);
  }

  void _logout() {
    _presenter.logout();
  }

  void _hideDrawer() {
    Navigator.pop(context);
  }
}
