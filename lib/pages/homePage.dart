import 'dart:convert';

import 'package:ezrisk/api_sevice/api.dart';
import 'package:ezrisk/models/app_config.dart';
import 'package:ezrisk/pages/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

import 'package:carousel_slider/carousel_slider.dart';

import '../models/contry.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://mocki.io/v1/6369382c-cb9d-4134-abac-4e616e1360cf";
  final url1 = "https://mocki.io/v1/72c37950-ffd1-44b4-b60e-c4b55cf17b8ba";
  late String app_logo;
  // late bool _loading;
  @override
  void initState() {
    super.initState();
    setState(() {
      loadData();
      loadData2();
    });
  }

  loadData() async {
    final response = await http.get(Uri.parse(url));
    final countryJson = response.body;
    final decodeData = jsonDecode(countryJson);
    final CountryData = decodeData["contry"];
    CountryModel.items =
        List.from(CountryData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  loadData2() async {
    final response = await http.get(Uri.parse(url1));
    final countryJson = response.body;
    final decodeData = jsonDecode(countryJson);
    app_logo = decodeData[0]['app_logo'];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
          // title: Image.network(app_logo, fit: BoxFit.cover),
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
            SizedBox(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.flag_outlined),
                "Select Your Country:".text.underline.xl3.make().p12(),
                Icon(Icons.flag_outlined),
              ],
            )),
            Container(
                height: 300,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemCount: CountryModel.items.length,
                    itemBuilder: (context, index) {
                      final country = CountryModel.items[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (() {
                            print(country);
                          }),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(country.c_icon),
                          ),
                        ),
                      );
                      // return Container(
                      //   padding: EdgeInsets.all(15),
                      //   margin: EdgeInsets.all(10),
                      //   height: 90,
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //         image: NetworkImage(country.c_icon),
                      //         fit: BoxFit.fill),
                      //     border: Border.all(width: 1),
                      //     borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      //   ),
                      // child: Column(
                      //   children: [
                      //     // Image.network(
                      //     //   country.c_icon,
                      //     //   fit: BoxFit.cover,
                      //     // ),
                      //     CountryModel.items[index].c_name.text.make(),
                      //   ],
                      // )
                      // );
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
