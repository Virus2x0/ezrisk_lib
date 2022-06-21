import 'dart:ffi' as size;

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'homePage.dart';

getInstance() async {
  var prefs = await SharedPreferences.getInstance();

  return prefs.getBool('isSeen');
}

void setInstance() async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setBool('isSeen', true);
}

class WelcomeSplash extends StatefulWidget {
  WelcomeSplash({Key? key}) : super(key: key);

  @override
  State<WelcomeSplash> createState() => _WelcomeSplashState();
}

class _WelcomeSplashState extends State<WelcomeSplash> {
  void initState() {
    super.initState();

    var check = getInstance();
    print(check);

    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    check != true ? SecondScreen() : HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png",
            height: 150,
            width: 150,
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: Text(
              "Welcome",
              style: TextStyle(fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  void initState() {
    super.initState();
    setInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: IntroductionScreen(
            pages: [
              PageViewModel(
                title: "Title of first page",
                body:
                    "Here you can write the description of the page, to explain someting...",
                image: Center(
                  child: Image.network(
                      "https://thumbs.dreamstime.com/b/introduction-text-note-pad-office-desk-computer-technol-written-electronic-devices-paper-wood-table-above-concept-85304190.jpg",
                      height: 175.0),
                ),
              ),
              PageViewModel(
                  title: "Title of first page",
                  body:
                      "Here you can write the description of the page, to explain someting...",
                  image: Center(
                    child: Image.network(
                        "https://thumbs.dreamstime.com/b/introduction-text-note-pad-office-desk-computer-technol-written-electronic-devices-paper-wood-table-above-concept-85304190.jpg",
                        height: 175.0),
                  ),
                  reverse: true),
              PageViewModel(
                title: "Title of first page",
                body:
                    "Here you can write the description of the page, to explain someting...",
                image: Center(
                  child: Image.network(
                      "https://thumbs.dreamstime.com/b/introduction-text-note-pad-office-desk-computer-technol-written-electronic-devices-paper-wood-table-above-concept-85304190.jpg",
                      height: 175.0),
                ),
              )
            ],
            onDone: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            onSkip: () {},
            showSkipButton: true,
            skip: Text("Skip", style: TextStyle(fontSize: 18)),
            next: Text("Next", style: TextStyle(fontSize: 18)),
            done: const Text("Done",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Colors.blue,
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
          ),
        ),
      ),
    );
  }
}
