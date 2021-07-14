import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiUserAuthenticate{
  Future authenticateUser(String username, String password) async{
    var request = http.MultipartRequest('POST', Uri.parse('https://inctool.net/api-token-auth/'));

    request.fields.addAll({
      'username': username,
      'password': password
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String respondedData = await response.stream.bytesToString();
      Map valueStream = json.decode(respondedData);
      return [response.statusCode, valueStream];
    }
    else {
      return [response.statusCode, response.reasonPhrase];
    }
  }
}