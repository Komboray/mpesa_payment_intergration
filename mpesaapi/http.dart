import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HTTPHelper {
  late String jsonString;

  ///////////////fetching the

  Future<List<Map>> fetchItems() async {

    List<Map> items = [];
    http.Response response = await http.get(Uri.parse("https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"));

    if(response.statusCode == 200) {
      jsonString = response.body;

      items = jsonDecode(jsonString);
      var headers = {
      'key':'Authorization',
        'Authorization': 'Basic VkZsd3oxR1dwSWVFeWdBVXJXTnFMQ09hMmhJSUNscVg6U2VoT21BQTMwNjNRU2h6MQ=='

      };
    }


    return items;
  }

////////get an item map
  Future<Map> getItems(String itemId) async{
     Map item = {};

        http.Response response= await http.get(Uri.parse('uri/$itemId'));

        if(response.statusCode == 200){
          item = jsonDecode(jsonString);

        }






    return item;
  }

  ////ADD
  Future <bool> addItems(Map data) async{
    bool status = false;



    return status;
  }

  ////////UPDATE
  Future <bool> updateItems(Map data, String itemId) async{
    bool status = false;



    return status;
  }


  Future <bool> deleteItems( String itemId ) async{
    bool status = false;



    return status;
  }

}
