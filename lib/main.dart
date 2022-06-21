import 'package:ezrisk/pages/WelcomeSplash.dart';
import 'package:ezrisk/pages/homePage.dart';
import 'package:ezrisk/pages/logIn_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Ezrisk",
        color: Colors.white,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => WelcomeSplash(),
          '/login': (context) => LogInPage(),
          '/home': (context) => HomePage(),
          // '/country': (context) => ChooseCountry()
        });
  }
}
