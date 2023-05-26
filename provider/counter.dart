import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier{
  ///////////initialize the elements of the class
  ////////You have to notify the listeners

  int _count = 0;
  int get count => _count;

  void increment(){
    _count++;
    notifyListeners();
}


  void reset(){
    _count=0;
    notifyListeners();
  }


  void decrement(){
    _count--;
    notifyListeners();
  }

}
