import 'package:bookvoed/screens/login/login.dart';
import 'package:bookvoed/screens/main/main_presenter.dart';
import 'package:bookvoed/screens/main/main_view.dart';
import 'package:bookvoed/screens/user/user_screen.dart';
import 'package:bookvoed/utils/text_utils.dart';
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
    var avatar = _presenter.getUserAvatar();
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои книги"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Container(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      _presenter.onUserClicked();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: isStringEmpty(avatar) ? AssetImage(
                                        'assets/images/no_avatar.jpg') : NetworkImage(avatar)))),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(_presenter.getUserFirstSecondName()),
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  _createMenuItem(
                      icon: Icons.library_books,
                      text: 'Мои книги',
                      onTap: () {
                        _hideDrawer();
                      }),
                  _createMenuItem(
                      icon: Icons.local_library,
                      text: 'Сейчас читаю',
                      onTap: () {
                        _hideDrawer();
                      }),
                  _createDivider(),
                  _createMenuItem(
                      icon: Icons.settings,
                      text: 'Настройки',
                      onTap: () {
                        _hideDrawer();
                      }),
                  _createMenuItem(
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

  @override
  void openUserScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UserScreen(null)));
  }

  void _barcodeReaderPressed() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", false, ScanMode.BARCODE);
  }

  Widget _createMenuItem(
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
      endIndent: 10,
    );
  }

  void _logout() {
    _presenter.logout();
  }

  void _hideDrawer() {
    Navigator.pop(context);
  }
}
