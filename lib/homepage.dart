import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String _qrResult = "hi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR code scanner",),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_qrResult,
          style: TextStyle(fontSize: 40.0),),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: Icon(Icons.camera_alt),
        onPressed: scan,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future scan() async {
    try {
      ScanResult barcode = await BarcodeScanner.scan();
      setState(() => _qrResult = barcode.rawContent.toString());
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          _qrResult = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => _qrResult = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => _qrResult = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => _qrResult = 'Unknown error: $e');
    }
  }
}
