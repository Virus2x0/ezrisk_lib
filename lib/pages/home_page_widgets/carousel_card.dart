import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CaroiselCard extends StatefulWidget {
  const CaroiselCard({Key? key}) : super(key: key);

  @override
  State<CaroiselCard> createState() => _CaroiselCardState();
}

class _CaroiselCardState extends State<CaroiselCard> {
  List dummyCard = [
    "New Changes ➜",
    "New Law 2022",
    "New Section 2022-A",
    "Amendment 2017",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: dummyCard.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Card(
                shadowColor: Colors.black,
                clipBehavior: Clip.antiAlias,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                          Colors.blue,
                          Colors.black,
                          Colors.blue,
                        ])),
                    child: Center(
                        child:
                            "${dummyCard[index]}".text.white.bold.xl4.make())),
              ),
            );
          },
          options: CarouselOptions(
            height: 170.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flag_outlined),
            "Select Your Country:".text.underline.xl3.make().p12(),
            Icon(Icons.flag_outlined),
          ],
        ),
      ],
    );
  }
}
