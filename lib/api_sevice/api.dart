// import 'dart:convert';

// class AppConfigApi {
//   final url = "https://mocki.io/v1/6369382c-cb9d-4134-abac-4e616e1360cf";

//   // late bool _loading;
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       loadData();
//     });
//   }

//   loadData() async {
//     final response = await http.get(Uri.parse(url));
//     final countryJson = response.body;
//     final decodeData = jsonDecode(countryJson);
//     final CountryData = decodeData["contry"];
//     CountryModel.items =
//         List.from(CountryData).map<Item>((item) => Item.fromMap(item)).toList();
//     setState(() {});
//   }
// }
