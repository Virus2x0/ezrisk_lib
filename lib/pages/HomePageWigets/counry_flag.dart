import 'package:flutter/material.dart';

import '../../models/contry.dart';
import '../info_list.dart';

class CountryFlag extends StatelessWidget {
  const CountryFlag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: CountryModel.items.length,
            itemBuilder: (context, index) {
              final country = CountryModel.items[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InfoList(
                                country: country,
                              ))),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(country.c_icon),
                  ),
                ),
              );
              // return Container(
              //   padding: EdgeInsets.all(15),
              //   margin: EdgeInsets.all(10),
              //   height: 90,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: NetworkImage(country.c_icon),
              //         fit: BoxFit.fill),
              //     border: Border.all(width: 1),
              //     borderRadius: BorderRadius.all(Radius.circular(50.0)),
              //   ),
              // child: Column(
              //   children: [
              //     // Image.network(
              //     //   country.c_icon,
              //     //   fit: BoxFit.cover,
              //     // ),
              //     CountryModel.items[index].c_name.text.make(),
              //   ],
              // )
              // );
            }));
  }
}
