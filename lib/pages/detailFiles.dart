 import 'package:ezrisk/models/app_config.dart';
import 'package:ezrisk/pages/pdf_page.dart';
import 'package:ezrisk/pages/widget/page_title.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import 'faq_page.dart';

class DetailsFile extends StatefulWidget {
  // final userSec;
  final sec_id;

  
  List laws = ["not having data", "not having data", "not having data", "not having data"];

  DetailsFile({Key? key, required this.sec_id}) : super(key: key);

  @override
  State<DetailsFile> createState() => _DetailsFileState();
}

class _DetailsFileState extends State<DetailsFile> {
   var type ;
  late List _users = [];

  void loadData() async {
    // String sec_id = widget.userSec;
    // String country = "country/";
    String sec_id = widget.sec_id ;
    var data = JsonServer(countryId: sec_id);
   var typeData = await data.infoData() ;
   
   
   type = typeData['type'];
    
   _users = typeData['results']   ;
   
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
          title: Image.asset(
            "assets/images/ezrisk_logo.png",
            height: 65,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          )),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              DTitle(title: "${type!=null ? type : "loading...."}"),
              // Image.network(widget.country.c_icon),
              DetailsList()
            ],
          ),
        ));
  }

  Widget DetailsList() {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          itemCount: _users.length,
          // itemCount: widget.laws.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            String PDFtitle = _users[index]['name'];
            String PDFlink = _users[index]['link'] ;
            return Card(
                elevation: 8,
                shadowColor: Colors.blueAccent,
                child: ListTile(
                  leading: Icon(Icons.clear_all_sharp),
                  //!! yahha likhnaa
                  // title: "${_users[index]['rules']}".text.bold.xl2.make(),
                  // subtitle: "${_users[index]['regulation']}".text.make(),
                  title: "${PDFtitle}".text.bold.xl2.make(),

                  trailing: ElevatedButton(
                    child: "  Open PDF ".text.make(),
                    onPressed: () {
                       Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => PDFPage(PDFtitle: PDFtitle,PDFlink: PDFlink ,)),
                         ); 
                     
                    },
                  ),
                ));
          },
        ),
      ),
    );
  }

}
