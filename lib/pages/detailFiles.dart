import 'dart:convert';

import 'package:ezrisk/pages/pdf_page.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:ezrisk/models/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class DetailsFile extends StatefulWidget {
  // final userSec;

  // const   DetailsFile({Key? key, required this.userSec}) : super(key: key);

  @override
  State<DetailsFile> createState() => _DetailsFileState();
}

class _DetailsFileState extends State<DetailsFile> {
  late List _users = [];

  void loadData() async {
    // String sec_id = widget.userSec;
    String country = "country/";

    // var url = Uri.parse(JsonServer.url + country + sec_id);
    // var response = await http.get(url);
    // var JsonDecode = jsonDecode(response.body);
    // print(url);
    // _users = JsonDecode;

    setState(() {});
  }

  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDeleate(),
                );
              },
              icon: Icon(Icons.search),
            ),
          ],
          title: "laws1".text.make(),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              //Image.network(widget.country.c_icon),
              DetailsList()
            ],
          ),
        ));
  }

  Widget DetailsList() {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          // itemCount: _users.length,
          itemCount: 3,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
                elevation: 8,
                shadowColor: Colors.blueAccent,
                child: ListTile(
                  leading: Icon(Icons.clear_all_sharp),
                  //!! yahha likhnaa
                  // title: "${_users[index]['rules']}".text.bold.xl2.make(),
                  // subtitle: "${_users[index]['regulation']}".text.make(),
                  title: "Law1".text.bold.xl2.make(),

                  trailing: ElevatedButton(
                    child: "  Open PDF ".text.make(),
                    onPressed: () {
                      Get.to(() => PDFPage());
                    },
                  ),
                ));
          },
        ),
      ),
    );
  }
}

class MySearchDeleate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {},
    );
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: Icon(Icons.cancel_outlined),
      onPressed: () => close(context, null),
    );
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(fontSize: 64),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
