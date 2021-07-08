import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_vision/google_ml_vision.dart';


class DashBoard extends StatefulWidget {
  static String id = 'DashBoard';
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  late final _image;


  _getBarcodeCode()async{
    final GoogleVisionImage visionImage = GoogleVisionImage.fromFile(_image);
    final BarcodeDetector barcodeDetector = GoogleVision.instance.barcodeDetector();
    final List<Barcode> barcodes = await barcodeDetector.detectInImage(visionImage);
    for (Barcode barcode in barcodes) {
      final rawValue = barcode.rawValue;
      log(rawValue.toString());
    }
  }

  final ImagePicker _picker = ImagePicker();
  _imgFromCamera() async {
    final image = await _picker.getImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
    _getBarcodeCode();
  }

  _imgFromGallery() async {
    final image = await _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });

    _getBarcodeCode();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                    }),
                ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

