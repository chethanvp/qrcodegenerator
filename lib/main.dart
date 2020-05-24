import 'package:flutter/material.dart';
import 'package:qrcodescanner/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QR code Scanner",
      home: HomePage(),
    );
  }
}