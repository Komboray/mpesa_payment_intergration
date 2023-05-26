import 'package:http/http.dart' as http;
import 'package:mpesa/mpesaapi/http.dart';
import 'package:mpesa/payment_screen/bookable.dart';
import 'package:mpesa/payment_screen/shopping.dart';
import 'package:mpesa/provider/shoppingcart.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'dart:convert';




class MpesaPayment extends StatelessWidget {
  double amount =1;
  String userPhone = '254727238639';
  String partyB = '174379';
  String phoneNumber = '254727238639';
  String businessShortCode = '174379';

  dynamic transactionInitialisation;
  Future <void>paymentOption() async{
    //Run it
    //try{


    transactionInitialisation =
    await MpesaFlutterPlugin.initializeMpesaSTKPush(
        businessShortCode:  businessShortCode,//use your store number if the transaction type is CustomerBuyGoodsOnline
        transactionType: TransactionType.CustomerPayBillOnline, //or CustomerBuyGoodsOnline for till numbers
        //////////Below is the amount that the customer is expected to pay
        amount: amount,
        //////////Below is the phone number to be sent to request payment//
        partyA: userPhone,
        ///////////Below is the biz short code
        partyB: partyB,
        callBackURL: Uri.parse('https://mydomain.com/path'),
        accountReference: 'order',
        ////phone number should be gotten from the user, or I will program it in my code.
        phoneNumber: phoneNumber,
        //////////below should be switched to live instance URL b4 moving to prod
        baseUri:  Uri.parse('https://sandbox.safaricom.co.ke'),
        transactionDesc: "payment",
        passKey: 'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919' as String);
    print("TRANSACTION RESULT: " + transactionInitialisation.toString());


    return transactionInitialisation;
    //} catch (e)
        {
      //you can implement your exception handling here.
      //Network un-reachability is a sure exception.

      /*
    Other 'throws':
    1. Amount being less than 1.0
    2. Consumer Secret/Key not set
    3. Phone number is less than 9 characters
    4. Phone number not in international format(should start with 254 for KE)
     */

      //print(e.getMessage());}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        pageSnapping: false,
        children: [
          Container(
            child: SafeArea(
              child: ListView(
                children: [
                  Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey.withOpacity(0.4),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextField(
                          onChanged: (value){
                            amount = value as double;

                            ///////////////////////////////////////YOU NEED NUMBER TO BE PASSED AND ADDED/////////////////////////////
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: '',
                              icon: Icon(Icons.money_rounded),
                              border: InputBorder.none

                          ),

                        ),
                      ),
                    ),
                  ),
                ),
                  ElevatedButton(
                    onPressed: () async{
                      paymentOption();
                    },
                    //////////////////////////////////////////WE REQUIRE THE MPESA SDK PUSH///////////////////////////////////////////////
                    child: const Text("Pay with Mpesa"),

                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Hesabu()));
                    },
                    //////////////////////////////////////////WE REQUIRE THE MPESA SDK PUSH///////////////////////////////////////////////
                    child: const Text("counter"),

                  ),
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }
}


// class Mpesa extends MpesaPayment{
//
//
//   dynamic transactionInitialisation;
//
//   Mpesa(double number){
//     number;
//   }
//
//   //Wrap it with a try-catch
//   //try {
//     paymentOption() async{
//   //Run it
//   transactionInitialisation =
//   await MpesaFlutterPlugin.initializeMpesaSTKPush(
//   businessShortCode: 174379 as String,//use your store number if the transaction type is CustomerBuyGoodsOnline
//   transactionType: TransactionType.CustomerPayBillOnline, //or CustomerBuyGoodsOnline for till numbers
//   amount: number,
//   partyA: 0727238639 as String,
//   partyB: 0727238639 as String,
//   callBackURL: Uri.parse('https://mydomain.com/path'),
//   accountReference: 'order',
//   phoneNumber: 0727238639 as String,
//   baseUri:  Uri.parse('https://sandbox.safaricom.co.ke'),
//   transactionDesc: "payment",
//   passKey: 'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919' as String);
//
//   //} catch (e)
//   {
//   //you can implement your exception handling here.
//   //Network un-reachability is a sure exception.
//
//   /*
//     Other 'throws':
//     1. Amount being less than 1.0
//     2. Consumer Secret/Key not set
//     3. Phone number is less than 9 characters
//     4. Phone number not in international format(should start with 254 for KE)
//      */
//
//   //print(e.getMessage());}
//   }
// }
// }
//
// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);
//
//
//
// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));
//
// String welcomeToJson(Welcome data) => json.encode(data.toJson());
//
// class Welcome {
//   Welcome({
//     required this.businessShortCode,
//     required this.password,
//     required this.timestamp,
//     required this.transactionType,
//     required this.amount,
//     required this.partyA,
//     required this.partyB,
//     required this.phoneNumber,
//     required this.callBackUrl,
//     required this.accountReference,
//     required this.transactionDesc,
//   });
//
//   String businessShortCode;
//   String password;
//   String timestamp;
//   String transactionType;
//   String amount;
//   String partyA;
//   String partyB;
//   String phoneNumber;
//   String callBackUrl;
//   String accountReference;
//   String transactionDesc;
//
//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//     businessShortCode: json["BusinessShortCode"],
//     password: json["Password"],
//     timestamp: json["Timestamp"],
//     transactionType: json["TransactionType"],
//     amount: json["Amount"],
//     partyA: json["PartyA"],
//     partyB: json["PartyB"],
//     phoneNumber: json["PhoneNumber"],
//     callBackUrl: json["CallBackURL"],
//     accountReference: json["AccountReference"],
//     transactionDesc: json["TransactionDesc"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "BusinessShortCode": businessShortCode,
//     "Password": password,
//     "Timestamp": timestamp,
//     "TransactionType": transactionType,
//     "Amount": amount,
//     "PartyA": partyA,
//     "PartyB": partyB,
//     "PhoneNumber": phoneNumber,
//     "CallBackURL": callBackUrl,
//     "AccountReference": accountReference,
//     "TransactionDesc": transactionDesc,
//   };
// }


