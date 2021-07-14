import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'CameraScreen.dart';
import 'dart:developer';


class DashBoard extends StatefulWidget {
  static String id = 'DashBoard';

  const DashBoard({Key? key}) : super(key: key);


  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {


  @override
  Widget build(BuildContext context) {

    String? _data = 'welcome';



    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text(_data),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_data),
                ElevatedButton(
                  child: Text("Scan Barcode"),
                  onPressed: ()async{
                    final data = await Navigator.push(context, MaterialPageRoute(builder: (context)=> CameraWidget()));
                    setState(() {
                      _data= data;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

