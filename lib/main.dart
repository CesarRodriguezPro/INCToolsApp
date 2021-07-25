import 'package:inc_tools/Screens/CameraScreen.dart';
import 'package:inc_tools/Screens/NewTool.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'LoadingScreens/ToolsLoadingScreen.dart';


void main()async {
  await Hive.initFlutter();
  await Hive.openBox('API');
  await Hive.openBox('UserData');
  await Hive.openBox('tools');
  await Hive.openBox('types');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context)=>LoginScreen(),
        DashBoard.id: (context)=>DashBoard(),
        CameraWidget.id: (context)=>CameraWidget(),
        ToolsLoadingScreen.id: (context)=>ToolsLoadingScreen(),
        NewToolPage.id: (context)=>NewToolPage(),
      },
    );
  }


}
