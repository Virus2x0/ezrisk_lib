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
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: dummyCard.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Card(
                  shadowColor: Colors.black,
                  clipBehavior: Clip.antiAlias,
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Image.asset("${dummyCard[index]}"),
                      )),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 150.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flag_outlined),
            "Select Your Country:".text.underline.bold.xl3.make().p12(),
            Icon(Icons.flag_outlined),
          ],
        ),
      ],
    );
  }
}
