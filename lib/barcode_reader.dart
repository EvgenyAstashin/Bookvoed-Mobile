import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class BarcodeReaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Reader'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route')
        ),
      ),
    );
  }

}