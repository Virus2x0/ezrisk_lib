import 'package:ezrisk/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeSplash extends StatefulWidget {
  final isSeen;
  WelcomeSplash({this.isSeen});

  @override
  State<WelcomeSplash> createState() => _WelcomeSplashState(isSeen: isSeen);
}

class _WelcomeSplashState extends State<WelcomeSplash> {
  final isSeen;
  _WelcomeSplashState({this.isSeen});

  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => isSeen ? HomePage() : SecondScreen())));
    print(isSeen);
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
                  ),
                ),
              ),
              PageViewModel(
                title: "Title of first page",
                body:
                    "Here you can write the description of the page, to explain someting...",
                image: Center(
                  child: Image.network(
                    "https://thumbs.dreamstime.com/b/introduction-text-note-pad-office-desk-computer-technol-written-electronic-devices-paper-wood-table-above-concept-85304190.jpg",
                  ),
                ),
              ),
              PageViewModel(
                title: "Title of first page",
                body:
                    "Here you can write the description of the page, to explain someting...",
                image: Center(
                  child: Image.network(
                    "https://thumbs.dreamstime.com/b/introduction-text-note-pad-office-desk-computer-technol-written-electronic-devices-paper-wood-table-above-concept-85304190.jpg",
                  ),
                ),
              )
            ],
            onDone: () async {
              var prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isSeen', true);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            onSkip: () async {
              var prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isSeen', true);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
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
