import 'dart:convert';

import 'package:ezrisk/pages/widgets/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ezrisk/models/app_config.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordPage extends StatefulWidget {
  final userSec;
  const ForgotPasswordPage({Key? key, required this.userSec}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late List _user = [];

  void loadData() async {
    String sec_id = widget.userSec;
    String country = "country";

    var url = Uri.parse(JsonServer.url + country + sec_id);
    var response = await http.get(url);
    var JsonDecode = jsonDecode(response.body);
    _user = JsonDecode;
    setState(() {});
  }

  void initState() {
    super.initState();
    loadData();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password "),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
            child: Container(
              width: 250,
              height: 200,
              // color: Colors.amber,
              // child: Image.asset("asset/images/ezrisk.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "FORGOT PASSWORD? 🔐",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
            child: Text(
                "Enter the email address associated with your account and we'll send you a link to rest your password.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: (input) =>
                    input!.isValidEmail() ? null : "Please enter valid Email.",
                decoration: InputDecoration(
                  hintText: "Enter Valid Email",
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 120,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.back;
                    Get.snackbar(
                      "Done✔️",
                      "Link to reset your password has been sent to your email",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.indigo.shade400,
                    );
                    Get.offAllNamed('/logIn');
                  }
                },
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      )),
    );
  }
}
