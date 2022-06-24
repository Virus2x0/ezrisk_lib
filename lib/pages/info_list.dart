import 'dart:convert';
import 'package:ezrisk/models/contry.dart';
import 'package:ezrisk/pages/detailFiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ezrisk/models/app_config.dart';
import 'package:http/http.dart' as http;

class InfoList extends StatefulWidget {
  final Item country;

  const InfoList({Key? key, required this.country}) : super(key: key);

  @override
  State<InfoList> createState() => _InfoListState();
}

class _InfoListState extends State<InfoList> {
  late List _user = [];

  void loadData() async {
    String id = widget.country.c_id.toString();

    var url = Uri.parse(JsonServer.url + id);
    var response = await http.get(url);
    var JsonDecode = jsonDecode(response.body);
    _user = JsonDecode;
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
          title: "${widget.country.c_name}".text.make(),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [Image.network(widget.country.c_icon), StandardList()],
          ),
        ));
  }

  Widget StandardList() {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          itemCount: _user.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final userSec = _user[index]['sec_id'];
            print(userSec);
            return Card(
                elevation: 8,
                shadowColor: Colors.blueAccent,
                child: ListTile(
                  leading: Icon(Icons.clear_all_sharp),
                  title: "${_user[index]['cat_name']}".text.bold.xl2.make(),
                  subtitle: "${_user[index]['sec_id']}".text.make(),
                  trailing: ElevatedButton(
                    child: "  Open  ".text.make(),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailsFile(userSec: userSec)));
                      // Get.to(() => DetailsFile(userSec: userSec));
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
