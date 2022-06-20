import 'package:ezrisk/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Ezrisk",
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Colors.indigo[600],
        ),
        initialRoute: '/home',
        routes: {
          // '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          // '/country': (context) => ChooseCountry()
        });
  }
}
