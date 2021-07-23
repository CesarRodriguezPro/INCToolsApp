import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'CameraScreen.dart';
import 'NewTool.dart';





class DashBoard extends StatefulWidget {
  static String id = 'DashBoard';
  const DashBoard({Key? key}) : super(key: key);


  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Welcome'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Text("Scan Barcode"),
                  onPressed: ()async{
                    final data = await Navigator.push(context, MaterialPageRoute(builder: (context)=> CameraWidget()));
                  },
                ),
                ElevatedButton(
                  child: Text("New Tool"),
                  onPressed: ()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewToolPage()));
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

