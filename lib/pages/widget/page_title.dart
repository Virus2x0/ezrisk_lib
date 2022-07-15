import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DTitle extends StatelessWidget {
  String title;
  DTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: "${title}".text.underline.bold.start.xl4.make().p(5)),
        SizedBox(height: 20)
      ],
    );
  }
}
