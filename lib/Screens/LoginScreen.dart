import 'package:flutter/material.dart';
import 'dart:developer';
import '../support/authenticateUser.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Dashboard.dart';



class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  const LoginScreen();



  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    const TextStyle Welcome = TextStyle(fontSize: 30);
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    return  MaterialApp(
        title: 'International Concrete Tools',
        home: Scaffold(
          appBar: AppBar(title:Text('International Concrete')),
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome',style: Welcome, ),
                  Text('Please Sign In', style: Welcome,),
                  loginUsername(_usernameController),
                  loginPassword(_passwordController),
                  ElevatedButton(onPressed: ()async {
                    ApiUserAuthenticate loginUser = ApiUserAuthenticate();
                    var token = await loginUser.authenticateUser( _usernameController.text, _passwordController.text);
                    if(token[0] == 200){
                      var apiBox = Hive.box('API');
                      String _token = token[1]['token'];
                      apiBox.put('api_key', _token);
                      Navigator.pushNamed(context, DashBoard.id);

                    }else{
                      log("there is a problem with you password");
                    }
                  },
                      child: Text('Summit')),
                ],
              ),
            ),
          ),
        )
    );
  }

  Padding loginUsername(_usernameController) {
    return Padding(
      padding:EdgeInsets.all(16.0),
      child:TextFormField(
        decoration: InputDecoration(labelText: 'Username',),
        controller: _usernameController,
      ),
    );
  }

  Padding loginPassword(_passwordController) {
    return Padding(padding: EdgeInsets.all(16.0),
      child: TextFormField(
        obscureText: true,
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
        ),
      ),
    );
  }

}
