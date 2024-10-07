import 'package:flutter/material.dart';
//import 'package:goodcoffee/Values/ResponsiveApp.dart';

//import 'Pages/HomaPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //ResponsiveApp responsiveApp;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Good Coffee",
      theme: ThemeData(
        dialogBackgroundColor: Colors.blueGrey[900],
        primaryColor: Colors.black87,
        scaffoldBackgroundColor: 
      ),
      
    );
  }

  getTextTheme(){
    return TextTheme(
      headline3: TextStyle(
        color: Colors.white,
          fontSize: responsiveApp.headline3
      ),
      headline6: TextStyle(
        color: Colors.white,
          fontSize: responsiveApp.headline6
      ),
      bodyText1: TextStyle(
        color: Colors.black,
          fontSize: responsiveApp.bodyText1
      ),
      bodyText2: TextStyle(
        color: Colors.white,
          fontSize: responsiveApp.bodyText1
      ),
      headline2: TextStyle(
          color: Colors.white,
          fontSize: responsiveApp.headline2
      ),
    );
  }
}