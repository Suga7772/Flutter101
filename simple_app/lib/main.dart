import 'package:flutter/material.dart';
import 'package:simple_app/login.dart';
import 'package:simple_app/register.dart';

void main() {
  runApp(MaterialApp(
    //remove the debug banner on initial top right red color
    debugShowCheckedModeBanner: false,
    initialRoute: 'register',
    // routes define the pages in your application
    routes: { 
      'login' : (context) => const MyLogin(), // referring to the class we have made in login.dart file
      'register' : (context) => const MyRegister() // referring to the class we have made in register.dart file
    },
  ));
}
