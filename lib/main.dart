import 'package:allshayri/firstpage.dart';
import 'package:allshayri/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: splash(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.deepPurple),
  ));

}
