import 'package:flutter/material.dart';
import 'package:untitled/pages/choose_locations.dart';
import 'package:untitled/pages/home.dart';
import 'package:untitled/pages/loading.dart';


void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/' : (context) => Loading(),
          '/home' : (context) => Home(),
          '/location' : (context) => ChooseLocation(),
        }
    ),
  );
}
