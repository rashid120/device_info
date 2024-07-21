import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetProvider with ChangeNotifier{

  var connectivity = Connectivity().onConnectivityChanged;

  @override
  void notifyListeners() {

    connectivity = connectivity;
    super.notifyListeners();
  }

  void cond(){

    connectivity = connectivity;
    notifyListeners();
  }

}