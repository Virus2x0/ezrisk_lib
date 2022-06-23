// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:ezrisk/api_sevice/api.dart';
import 'package:ezrisk/models/app_config.dart';
import 'package:ezrisk/pages/HomePageWigets/CarouselCard.dart';
import 'package:ezrisk/pages/HomePageWigets/counryFlag.dart';
import 'package:ezrisk/pages/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

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
      // loadData2();
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

  //!! by Faizan
  // loadData2() async {
  //   final response = await http.get(Uri.parse(url1));
  //   final countryJson = response.body;
  //   final decodeData = jsonDecode(countryJson);
  //   app_logo = decodeData[0]['app_logo'];

  //   setState(() {});
  // }

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
            CaroiselCard(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.flag_outlined),
                "Select Your Country:".text.underline.xl3.make().p12(),
                Icon(Icons.flag_outlined),
              ],
            ),
            CountryFlag(),
            Expanded(
              child: Image.asset(
                "assets/images/world.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
