import 'package:flutter/material.dart';

class AddBookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add book'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Open Barcode scaner'),
          onPressed: () => _barcodeReaderPressed(context),
        ),
      ),
    );
  }

  void _barcodeReaderPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddBookScreen()),
    );
  }
}