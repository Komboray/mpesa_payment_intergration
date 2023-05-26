import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BaseClient{
  ////declare the get url being used////////////////it will be transformed into a parse url later on////////////

  var client = http.Client();

  String baseUrl = 'https://sandbox.safaricom.co.ke/';

  Future <dynamic> get(String api) async{
    
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': 'Bearer sfieeeeee',
      'api_key':'ieeeeeeeeeefgtresdew'
    };

    var response = await client.get(url, headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }else{
      //throw exception
    }

  }


}