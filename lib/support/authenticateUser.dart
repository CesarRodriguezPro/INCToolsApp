import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Helpers.dart';
import 'package:hive/hive.dart';


class ApiUserAuthenticate{
  Future authenticateUser(String username, String password) async{
    var request = http.MultipartRequest('POST', Uri.parse('https://inctool.net/api-token-auth/'));

    request.fields.addAll({
      'username': username,
      'password': password
    });

    http.StreamedResponse response = await request.send();

    if(response.statusCode == 200 ){
      String respondedData = await response.stream.bytesToString();
      Map valueStream = json.decode(respondedData);
      String _token = valueStream['token'].toString();
      var apiBox = Hive.box('API');
      apiBox.put('token', _token);
      return response.statusCode;

    }else{
      return response.statusCode;

    }
  }
}


class CurrentEmployeeData{

  Future currentUser()async{

    var apiKey = ApiKeyAccess();
    String apiKeySaved = apiKey.apiKey();

    var headers = {
      'Authorization': 'TOKEN $apiKeySaved'
    };

    var request = http.Request('GET', Uri.parse('https://inctool.net/api/user/'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200 ){

      String respondedData = await response.stream.bytesToString();
      Map valueStream = json.decode(respondedData);
      var userData = Hive.box('UserData');
      userData.put('username', valueStream['username']);
      userData.put('first_name', valueStream['first_name']);
      userData.put('last_name', valueStream['last_name']);
      userData.put('pk', valueStream['pk']);
      userData.put('location', valueStream['location']);
    }else{
      print(response.statusCode);
      return response.statusCode;
    }
  }

}