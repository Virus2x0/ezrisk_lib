import 'package:ezrisk/models/contry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class InfoList extends StatelessWidget {
  final Item country;
  const InfoList({Key? key, required this.country}) : super(key: key);

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
          title: "${country.c_name}".text.make(),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [Image.network(country.c_icon), StandardList()],
          ),
        ));
  }

  Widget StandardList() {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 3,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
                elevation: 8,
                shadowColor: Colors.blueAccent,
                child: ListTile(
                  leading: Icon(Icons.clear_all_sharp),
                  title: "${country.c_name}".text.bold.xl2.make(),
                  trailing: ElevatedButton(
                    child: "  Open  ".text.make(),
                    onPressed: () {},
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
