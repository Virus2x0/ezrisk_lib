import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            color: Colors.amberAccent,
            height: 150,
          )
        ],
      ),
    );
  }
}
