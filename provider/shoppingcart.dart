import 'package:flutter/material.dart';

class ShoppingCart with ChangeNotifier{
   final List<String> _shoppingCart = [
     "Apple",
     "Orange",
     "Grapes",
   ];

   ////getter for accessing the count

   int get count => _shoppingCart.length;
   ////getter for accessing the shopping cart list outside the class/////////////
   List<String> get cart => _shoppingCart;


   void addItems(String item){
     _shoppingCart.add(item);
     notifyListeners();
   }
}