import 'dart:convert';

import 'package:ezrisk/pages/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://mocki.io/v1/48610350-9a3a-4416-96af-800ced98f9de";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final response = await http.get(Uri.parse(url));

    final CountryJson = response.body;

    final decodeData = jsonDecode(CountryJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
          title: Image.asset("assets/images/1.png", fit: BoxFit.cover),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))]),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 15),
            CarouselSlider(
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
            ),
            SizedBox(child: "Countries".text.start.xl3.make().p12()),
            Container(
                height: 300,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),

                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),

                        child: "India".text.center.make(),
                        // child: OutlinedButton(
                        //   style: OutlinedButton.styleFrom(
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(50),
                        //     ),
                        //     side: BorderSide(color: Colors.blue, width: 1.2),
                        //   ),
                        //   onPressed: () {},
                        //   child: "India".text.make(),
                      );
                    })),
            Expanded(
              child: Image.asset(
                "assets/images/world.png",
                fit: BoxFit.cover,
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              //   child: Container(
              //     height: 20,
              //     // color: Col2ors.amber,
              //     width: MediaQuery.of(context).size.width,
              //     child: ListView.builder(
              //       itemCount: 4,
              //       itemBuilder: (context, index) {
              //         return Container(
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(50)),
              //           height: 80,
              //           child: Card(
              //               clipBehavior: Clip.antiAlias,
              //               elevation: 8,
              //               child: "Laws".text.xl2.bold.make().p12()),
              //         );
              //       },
              //     ),
              //   ),
            ),
          ],
        ),
      ),
    );
  }
}
