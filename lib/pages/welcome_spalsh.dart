import 'package:ezrisk/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';

import 'in_boarding_screen.dart';

class WelcomeSplash extends StatefulWidget {
  final isSeen;
  WelcomeSplash({this.isSeen});

  @override
  State<WelcomeSplash> createState() => _WelcomeSplashState(isSeen: isSeen);
}

class _WelcomeSplashState extends State<WelcomeSplash> {
  final isSeen;
  bool isLoad = false;
  _WelcomeSplashState({this.isSeen});

  void initState() {
    super.initState();

    isLoad = true;

    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    isSeen ? HomePage() : InBoardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 150, 243, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/ezrisk_logo.png",
            height: 150,
            width: 150,
          ),
          SizedBox(height: 60),
          SizedBox(
            height: 100,
            width: 100,
            child: Lottie.network(
                "https://assets1.lottiefiles.com/packages/lf20_9evakyqx.json"),
          )
        ],
      ),
    );
  }
}
