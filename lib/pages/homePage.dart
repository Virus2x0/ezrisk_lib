import 'package:ezrisk/pages/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))]),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 170,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                color: Colors.indigo,
                elevation: 8,
              ),
            ),
          ),
          Container(
              // color: Colors.amberAccent,
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // decoration: BoxDecoration(),
                            color: Colors.cyan,
                            padding: EdgeInsets.all(30),
                            child: Text("hello"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child:
                              ListView.builder(itemBuilder: (context, index) {
                            return ListTile(
                              title: Text("Law"),
                            );
                          }),
                        )
                      ],
                    );
                  })),
        ],
      ),
    );
  }
}
