import 'package:ezrisk_application/widgets/WelcomeSplash.dart';
import 'package:ezrisk_application/widgets/profile_admin.dart';
import 'package:ezrisk_application/Pages/forgot_password_page.dart';
import 'package:ezrisk_application/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'Pages/home_page.dart';
import 'Pages/logIn_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

var isSeen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  isSeen = await (prefs.getBool('isSeen') ?? false);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EZRISK',
        // theme: ThemeData.dark(),
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        home: WelcomeSplash(isSeen: isSeen));
    // initialRoute: '/home',
    //when initial Route is given no need to add home widget for initial start point of app
    //full app route structure
    // routes: {
    //   '/': (context) => LogInPage(),
    //   '/home': (context) => HomePage(),
    //   '/forgotPass': (context) => ForgotPasswordPage(),
    // });
  }
}
