import 'dart:developer';
import 'support/authenticateUser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    const TextStyle Welcome = TextStyle(fontSize: 30);
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return MaterialApp(
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

                  log(_passwordController.text);
                  ApiUserAuthenticate loginUser = ApiUserAuthenticate();
                  var _token = await loginUser.authenticateUser( _usernameController.text, _passwordController.text);
                  if(_token[0] == 200){
                    log(_token[1]['token']);
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
