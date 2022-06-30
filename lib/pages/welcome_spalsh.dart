import 'package:ezrisk/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    isSeen ? HomePage() : InBoardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/ezrisk_logo.png",
            height: 150,
            width: 150,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 300,
            child: Stack(children: [
              Positioned(
                top: 70,
                right: 5,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  child: Opacity(
                    opacity: isLoad ? 0 : 1,
                    child: Image.asset(
                      "assets/images/ezrisk_logo.png",
                      height: 80,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    "assets/images/ezrisk_logo.png",
                    height: 80,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    "assets/images/ezrisk_logo.png",
                    height: 80,
                  ),
                ),
              ),
              Positioned(
                top: 200,
                right: 5,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    "assets/images/ezrisk_logo.png",
                    height: 80,
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
