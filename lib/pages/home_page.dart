// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:ezrisk/api_sevice/api.dart';
import 'package:ezrisk/models/app_config.dart';
import 'package:ezrisk/pages/HomePageWigets/carousel_card.dart';
import 'package:ezrisk/pages/HomePageWigets/counry_flag.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
          title: "EzRisk".text.bold.make(),
          centerTitle: true,
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
