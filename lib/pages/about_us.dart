import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "About Us".text.make()),
      body: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Container(
            height: 230,
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 8,
              child: Column(
                children: [
                  "About US".text.xl2.bold.underline.make(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                            .text
                            .make(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
