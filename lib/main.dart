import 'package:ezrisk/pages/welcome_spalsh.dart';
import 'package:ezrisk/pages/home_page.dart';
import 'package:ezrisk/pages/logIn_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

var isSeen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  isSeen = await (prefs.getBool('isSeen') ?? false);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Ezrisk",
        color: Colors.white,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => WelcomeSplash(
                isSeen: isSeen,
              ),
          '/login': (context) => LogInPage(),
          '/home': (context) => HomePage(),
        });
  }
}
