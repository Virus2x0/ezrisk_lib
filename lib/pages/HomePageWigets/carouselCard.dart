import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CaroiselCard extends StatelessWidget {
  const CaroiselCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 170.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Card(
                shadowColor: Colors.blue,
                color: Colors.blue,
                elevation: 8,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
