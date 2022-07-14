import 'package:ezrisk/models/contry.dart';
import 'package:ezrisk/pages/detailFiles.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ezrisk/models/app_config.dart';

class InfoList extends StatefulWidget {
  final Item country;

  const InfoList({Key? key, required this.country}) : super(key: key);

  @override
  State<InfoList> createState() => _InfoListState();
}

class _InfoListState extends State<InfoList> {
  late List _user = [];
  // List Dummy = ["Laws", "Standards", "Regulatories", "National Regulatories"];

  void loadData() async {
    String id = widget.country.c_id.toString() ;
    var data = JsonServer(countryId: id);
    
    var _userData = await data.countryData() ;
    
    _user = _userData ;
    

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
          title: Image.asset(
            "assets/images/ezrisk_logo.png",
            height: 65,
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          )),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 8,
                      child: Image.network(widget.country.c_icon)),
                ),
                StandardList()
              ],
            ),
          ),
        ));
  }

  Widget StandardList() {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          // itemCount: _user.length,
          itemCount: _user.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final sec_id = _user[index]['sec_id'];
            
            // final userSec = _user[index]['sec_id'];
            // print(userSec);
            return Card(
                elevation: 8,
                // shadowColor: Colors.blueAccent,
                child: ListTile(
                  leading: Icon(Icons.clear_all_sharp),
                  title: "${_user[index]['cat_name']}".text.bold.xl2.make(),
                  // subtitle: "${_user[index]['sec_id']}".text.make(),
                  // title: "Laws".text.bold.xl2.make(),
                  // subtitle: "${_user[index]['sec_id']}".text.make(),
                  trailing: ElevatedButton(
                    child: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  // DetailsFile(userSec: userSec)));
                                  DetailsFile(sec_id: sec_id ,)));
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
