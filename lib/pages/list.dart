import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ManageStandards extends StatefulWidget {
  const ManageStandards({Key? key}) : super(key: key);

  @override
  State<ManageStandards> createState() => _ManageStandardsState();
}

class _ManageStandardsState extends State<ManageStandards> {
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
            // IconButton(
            //   //shorting
            //   onPressed: () {},
            //   icon: Icon(Icons.sort_by_alpha),
            // )
          ],
          title: "Manage Standards".text.make(),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showAlertDialogs(context);
          },
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              // "List of auditees".text.bold.xl3.make(),
              // ButtonNewStandard(),
              StandardList()
            ],
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
                shadowColor: Colors.indigo,
                child: ListTile(
                  leading: Icon(Icons.clear_all_sharp),
                  title: "ISO 27001".text.bold.xl2.make(),
                  subtitle: "ISO standard for ISMS".text.make(),
                  trailing: ElevatedButton(
                    child: "  Edit  ".text.make(),
                    onPressed: () {
                      Standards();
                    },
                  ),
                ));
          },
        ),
      ),
    );
  }
}

showAlertDialogs(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        // insetAnimationCurve: Curve. ,
        elevation: 8,
        insetPadding: EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Container(
            height: 300,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                child: "Add New Standards".text.underline.bold.xl2.make(),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Standard Name",
                      border: OutlineInputBorder(),
                      labelText: "Standard Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Standard Description",
                      border: OutlineInputBorder(),
                      labelText: "Standard Description"),
                ),
              ),
              ButtonBar(
                children: [
                  ElevatedButton(
                    child: "Reset".text.make(),
                    onPressed: () {
                      _formKey.currentState?.reset();
                    },
                  ),
                  ElevatedButton(
                    child: "Add Standard".text.make(),
                    onPressed: () {
                      Get.snackbar(
                        "Done✔️",
                        "Data Added.",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      _formKey.currentState?.reset();
                    },
                  )
                ],
              )
            ]),
          ),
        ),
      );
    },
  );
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

class Standards extends StatelessWidget {
  const Standards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
