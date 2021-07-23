import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Helpers.dart';
import 'package:hive/hive.dart';

class TypesAPI{

  Future listTypesTools()async {
    // Get all types of tools save in the database in the server.


    // get token for verification
    Map<String, String> headers = getHeader();


    // send request
    var request = http.MultipartRequest(
        'GET', Uri.parse('https://inctool.net/api/type'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    // return Api Info
    if (response.statusCode == 200) {
      String respondedData = await response.stream.bytesToString();
      var valueStream = json.decode(respondedData);
      return valueStream;
    }else{
      return [response.statusCode];
    }
  }

  Future newTypeApi({ String? name })async{
    // this will create a new type of tool in the server.

    // get token for verification
    Map<String, String> headers = getHeader();

    // send request in POST
    var request = http.MultipartRequest('POST', Uri.parse('https://inctool.net/api/'));
    request.fields.addAll({'code': name!}); // data to be send
    request.headers.addAll(headers);        // load heather and apikey
    http.StreamedResponse response = await request.send();

    // return request answer
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

}