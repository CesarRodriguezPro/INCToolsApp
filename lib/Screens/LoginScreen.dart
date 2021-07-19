import 'package:flutter/material.dart';
import '../support/authenticateUser.dart';
import 'Dashboard.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _offStage = true;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  static const TextStyle Welcome = TextStyle(fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'International Concrete Tools',
        home: Scaffold(
          appBar: AppBar(
            title:Text('International Concrete'),
            centerTitle: true,
          ),
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome',style: Welcome, ),
                  Text('Please Sign In', style: Welcome,),
                  ErrorMessage(offStage: _offStage),
                  loginUsername(_usernameController),
                  loginPassword(_passwordController),
                  ElevatedButton(onPressed: ()async {
                    ApiUserAuthenticate loginUser = ApiUserAuthenticate();
                    var tokenStatus = await loginUser.authenticateUser( _usernameController.text, _passwordController.text);
                    if(tokenStatus == 200){
                      var currentUser = CurrentEmployeeData();
                      currentUser.currentUser();
                      Navigator.pushNamed(context, DashBoard.id);
                    }else{
                      setState(() {_offStage = false;});
                    }
                  }, child: Text('Summit')),
                ],
              ),
            ),
          ),
        )
    );
  }

  Padding loginUsername(_usernameController) {
    return Padding(
      padding:EdgeInsets.all(10.0),
      child:TextFormField(
        decoration: InputDecoration(labelText: 'Username',),
        controller: _usernameController,
      ),
    );
  }

  Padding loginPassword(_passwordController) {
    return Padding(padding: EdgeInsets.all(10.0),
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

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, required bool offStage,}) : _offStage = offStage, super(key: key);
  final bool _offStage;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: _offStage,
      child: Card(
        color:Colors.red,
        elevation: 10.0,
        child: SizedBox(
          height: 30.0,
          child: Row(
            children: [
              Expanded(
                  child: Text(
                    'Wrong Password or Username',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
