import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:image_picker/image_picker.dart';


class DashBoard extends StatefulWidget {
  static String id = 'DashBoard';
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  void takePictures() async{
    final _picker = ImagePicker();
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    final bytes = await pickedFile!.readAsBytes();
    log(bytes.toString());
  }

  Future<String> barcodeDetector()async{
    takePictures();
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
              ),
              onPressed: (){
                log('hello world');
                barcodeDetector();
              },
              child: Text('Receive Item'),
            ),
          ),
        ),
      ),
    );
  }
}

