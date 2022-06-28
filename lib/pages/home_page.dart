// ignore_for_file: unnecessary_null_comparison
import 'dart:convert';

import 'package:ezrisk/pages/widget/default_appbar.dart';
import 'package:ezrisk/pages/widget/drawer.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import '../models/contry.dart';

import 'home_page_widgets/carousel_card.dart';
import 'home_page_widgets/counry_flag.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://mocki.io/v1/3a129353-9e63-42e3-adf5-d04acdfe5605";
  bool isLoad = true;
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
      appBar: DAppbar(),
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
            if (CountryModel.items != null && CountryModel.items.isNotEmpty)
              CountryFlag()
            else
              CircularProgressIndicator().centered().expand(),
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
