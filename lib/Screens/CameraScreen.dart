import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'Dashboard.dart';

class CameraWidget extends StatefulWidget {
  static String id = 'CameraWidget';
  const CameraWidget({Key? key}) : super(key: key);

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child:Center(
                        child: SizedBox(
                          width: 300.0,
                          height: 600.0,
                          child: QrCamera(
                            qrCodeCallback: (code) {
                              Navigator.pop(context, code);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                    color: Colors.orange,
                                    width: 10.0,
                                    style: BorderStyle.solid),
                              ),
                            ),
                          ),
                        ),
                      )),
                  ElevatedButton(

                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  ],
              ),
            ),
          ),
        )
      );
    }
  }
