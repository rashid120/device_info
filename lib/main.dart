import 'package:device_info/home_page.dart';
import 'package:flutter/material.dart';
import 'package:open_share_plus/open_share_plus.dart';

void main(){

  // OpenShare.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}