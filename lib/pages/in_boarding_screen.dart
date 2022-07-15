import 'package:flutter/material.dart';
import 'package:ezrisk/pages/home_page.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InBoardingScreen extends StatefulWidget {
  InBoardingScreen({Key? key}) : super(key: key);

  @override
  State<InBoardingScreen> createState() => _InBoardingScreenState();
}

class _InBoardingScreenState extends State<InBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: IntroductionScreen(
            globalBackgroundColor: Colors.blue[500],
            pages: [
              PageViewModel(
                decoration: PageDecoration(contentMargin: EdgeInsets.all(30)),
                title: "Title Of First Page",
                body:
                    "Here you can write the description of the page, to explain someting...",
                image: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 70,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.network(
                      "https://thumbs.dreamstime.com/b/introduction-text-note-pad-office-desk-computer-technol-written-electronic-devices-paper-wood-table-above-concept-85304190.jpg",
                    ),
                  ),
                ),
              ),
              PageViewModel(
                decoration: PageDecoration(
                    imagePadding: EdgeInsets.only(bottom: 100),
                    bodyPadding: EdgeInsets.only(top: 20),
                    titlePadding: EdgeInsets.only(top: 200),
                    contentMargin: EdgeInsets.all(30)),
                reverse: true,
                title: "Title Of Second Page",
                body:
                    "Here you can write the description of the page, to explain someting...",
                image: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 70,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.network(
                      "https://thumbs.dreamstime.com/b/introduction-text-note-pad-office-desk-computer-technol-written-electronic-devices-paper-wood-table-above-concept-85304190.jpg",
                    ),
                  ),
                ),
              ),
              PageViewModel(
                decoration: PageDecoration(contentMargin: EdgeInsets.all(30)),
                title: "Title of third page",
                body:
                    "Here you can write the description of the page, to explain someting...",
                image: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 70,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.network(
                      "https://thumbs.dreamstime.com/b/introduction-text-note-pad-office-desk-computer-technol-written-electronic-devices-paper-wood-table-above-concept-85304190.jpg",
                    ),
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
            skip: Text("Skip",
                style: TextStyle(fontSize: 18, color: Colors.white)),
            next: Text("Next",
                style: TextStyle(fontSize: 18, color: Colors.white)),
            done: const Text("Done",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white)),
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Colors.white,
                color: Colors.white54,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
          ),
        ),
      ),
    );
  }
}
