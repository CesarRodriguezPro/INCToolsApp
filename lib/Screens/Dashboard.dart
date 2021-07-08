import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:hive/hive.dart';

class DashBoard extends StatefulWidget {
  static String id = 'DashBoard';
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  BarcodeDetector detector = GoogleVision.instance.barcodeDetector();
  List<String> data = [];

  Future<String> barcodeDetector()async{

    // final GoogleVisionImage visionImage = GoogleVisionImage.fromFile(imageFile);
    // final BarcodeDetector barcodeDetector = GoogleVision.instance.barcodeDetector();
    // final List<Barcode> barcodes = await barcodeDetector.detectInImage(visionImage);
    // var rawValue;
    // for (Barcode barcode in barcodes) {
    //   rawValue = barcode.rawValue;
    // }
    // return rawValue;

    return 'hello';
  }

  String barcode = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child:Text('hello world'),
          ),
        ),
      ),
    );
  }
}

