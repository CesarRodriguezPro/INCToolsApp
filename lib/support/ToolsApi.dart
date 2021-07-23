
import 'package:http/http.dart' as http;
import 'Helpers.dart';
import 'package:hive/hive.dart';

class ToolsAPI{

  Future listOfTools()async{

    var apiKeySaved = ApiKeyAccess().apiKey();
    var headers = {'Authorization': 'TOKEN $apiKeySaved'};

    var request = http.MultipartRequest('GET', Uri.parse('https://inctool.net/api/'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return responseHelper(response);
  }

  Future newToolApi({ String? code, String? type, String? tags, String? quantity, String? active })async{

    // get token for verification
    var apiKeySaved = ApiKeyAccess().apiKey();
    var headers = {'Authorization': 'TOKEN $apiKeySaved'};


    // send request
    var request = http.MultipartRequest('POST', Uri.parse('https://inctool.net/api/'));
    var userData = Hive.box('UserData');
    request.fields.addAll({
      'code': code!,
      'type': type!,
      'tags': tags!,
      'quantity': quantity!,
      'active': active!,
      'current_user': userData.get('pk').toString(),
      'current_location': userData.get('location').toString(),
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();


    // return request answer
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

}
