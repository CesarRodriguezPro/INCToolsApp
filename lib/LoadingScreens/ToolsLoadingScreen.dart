import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inc_tools/Screens/NewTool.dart';
import '../support/ToolsTypesAPI.dart';


class ToolsLoadingScreen extends StatefulWidget {
  static String id = 'ToolsLoadingScreen';
  const ToolsLoadingScreen({Key? key}) : super(key: key);

  @override
  _ToolsLoadingScreenState createState() => _ToolsLoadingScreenState();
}

class _ToolsLoadingScreenState extends State<ToolsLoadingScreen> {
  List<String> typesTools = [];
  @override
  void initState() {
    super.initState();
    loadInfo();
  }

  void loadInfo()async{
    List typesOfTools = await TypesAPI().listTypesTools();

      typesOfTools.forEach((item){
        String name = item['name'];
        typesTools.add(name);
      });

      print(typesTools.toString());

      Navigator.push(context, MaterialPageRoute(builder: (context){
        return NewToolPage( typesTools:typesTools);
            },
          ),
      );
    }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SpinKitDoubleBounce(
            size: 70,
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}




