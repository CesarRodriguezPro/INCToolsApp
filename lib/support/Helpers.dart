
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hive/hive.dart';


Future responseHelper(http.StreamedResponse response)async{

  if (response.statusCode == 200) {
    String respondedData = await response.stream.bytesToString();
    Map valueStream = json.decode(respondedData);
    return [response.statusCode, valueStream];
  }
  else {
    return [response.statusCode, response.reasonPhrase];
  }
}


class ApiKeyAccess{
  String apiKey(){
    var box = Hive.box('API');
    String apiKey = box.get('api_key');
    return apiKey;
  }
}

