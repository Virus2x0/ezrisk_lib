import 'package:ezrisk/pages/about_us.dart';
import 'package:ezrisk/pages/feedback_page.dart';
import 'package:ezrisk/pages/logIn_page.dart';
import "package:flutter/material.dart";
import "package:velocity_x/velocity_x.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import '../faq_page.dart';
import '../home_page.dart';

class DrawerMenu extends StatefulWidget {
  DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  int _isSelected = 0;
  void changeSelected(int index) {
    setState(() {
      _isSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName:
                      Text("EzRisk", style: TextStyle(color: Colors.white)),
                  accountEmail: Text("info@ezrisk.com",
                      style: TextStyle(color: Colors.white)),
                  currentAccountPicture: CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Color.fromARGB(255, 220, 225, 230),
                    child: Image.asset(
                      "assets/images/ezrisk_logo.png",
                      fit: BoxFit.cover,
                      color: Colors.blue,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    ListTile(
                        selectedTileColor: Colors.grey[300],
                        // selected: _isSelected == 0,
                        iconColor: Colors.blue,
                        leading: Icon(Icons.home_outlined),
                        title: "Dashboard".text.xl.make(),
                        onTap: () {
                          Get.to(() => HomePage());
                          // changeSelected(0);
                        } // Te
                        ),
                    Divider(
                      color: Colors.black,
                    ),
                    // ExpansionTile(
                    //   childrenPadding: EdgeInsets.only(left: 15),
                    //   collapsedIconColor: Colors.blue,
                    //   leading: Icon(Icons.all_inbox_outlined),
                    //   title: "Documents".text.xl.make(),
                    //   children: [
                    //     ListTile(
                    //       selectedTileColor: Colors.grey[300],
                    //       selected: _isSelected == 2,
                    //       iconColor: Colors.blue,
                    //       leading: Icon(Icons.circle_outlined),
                    //       title: "Laws".text.xl.make(),
                    //       onTap: () {
                    //         // changeSelected(2);
                    //         // Get.to(() => InfoList());
                    //       },
                    //     ),
                    //     ListTile(
                    //       selectedTileColor: Colors.grey[300],
                    //       selected: _isSelected == 2,
                    //       iconColor: Colors.blue,
                    //       leading: Icon(Icons.circle_outlined),
                    //       title: "Sections".text.xl.make(),
                    //       onTap: () {
                    //         // changeSelected(2);
                    //         // Get.to(() => ManageStandards());
                    //       },
                    //     ),
                    //     ListTile(
                    //       selectedTileColor: Colors.grey[300],
                    //       selected: _isSelected == 2,
                    //       iconColor: Colors.blue,
                    //       leading: Icon(Icons.circle_outlined),
                    //       title: "Regulatories".text.xl.make(),
                    //       onTap: () {
                    //         // changeSelected(2);
                    //         // Get.to(() => ManageStandards());
                    //       },
                    //     ),
                    //   ],
                    //   // onTap: () {
                    //   //   changeSelected(1);
                    //   // } // Te
                    // ),
                    ListTile(
                      selectedTileColor: Colors.grey[300],
                      selected: _isSelected == 2,
                      iconColor: Colors.blue,
                      leading: Icon(Icons.info_outline),
                      title: "About Us".text.xl.make(),
                      onTap: () {
                        // changeSelected(2);
                        Get.to(() => AboutUs());
                      }, // Te
                    ),
                    ListTile(
                        selectedTileColor: Colors.grey[200],
                        selected: _isSelected == 3,
                        iconColor: Colors.blue,
                        leading: Icon(Icons.question_answer_outlined),
                        title: "FAQs".text.xl.make(),
                        onTap: () {
                          Get.to(() => FAQ());
                        }),
                    ListTile(
                        selectedTileColor: Colors.grey[200],
                        selected: _isSelected == 3,
                        iconColor: Colors.blue,
                        leading: Icon(Icons.feed_outlined),
                        title: "Feedback".text.xl.make(),
                        onTap: () {
                          Get.to(() => FeedBack());
                        }),
                    ListTile(
                        selectedTileColor: Colors.grey[300],
                        selected: _isSelected == 4,
                        iconColor: Colors.blue,
                        leading: Icon(Icons.star_border_outlined),
                        title: "Rate Us".text.xl.make(),
                        onTap: () {
                          _launchURL();
                        }),

                    ListTile(
                        selectedTileColor: Colors.grey[300],
                        selected: _isSelected == 4,
                        iconColor: Colors.blue,
                        leading: Icon(Icons.logout),
                        title: "Log Out".text.xl.make(),
                        onTap: () {
                          Get.to(() => LogInPage());
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

_launchURL() {
  const url = 'https://flutter.dev';

  // ignore: deprecated_member_use
  launch(url);
}
