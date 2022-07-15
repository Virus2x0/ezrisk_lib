import 'package:ezrisk/pages/widget/default_appbar.dart';
import 'package:ezrisk/pages/widget/email_validator.dart';
import 'package:ezrisk/pages/widget/page_title.dart';
import 'package:flutter/material.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import "package:velocity_x/velocity_x.dart";

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final _formKey = GlobalKey<FormState>();
  // bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppbar(),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DTitle(title: "Feedback"),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return "Please enter Auditee Name.";
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'email@example.com',
                      labelText: 'E-Mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                    ),
                    validator: (input) => input!.isValidEmail()
                        ? null
                        : "Please enter valid Email.",
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 3, //Normal textInputField will be displayed
                    maxLines: null,
                    decoration: InputDecoration(
                      // floatingLabelAlignment: FloatingLabelAlignment.,
                      hintText: 'Comments/Suggetions',
                      labelText: 'Comments',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      prefixIcon: Icon(Icons.insert_comment),
                    ),
                    validator: (input) => input!.isEmpty
                        ? "Please give your comment/feedback."
                        : null,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //TODO  add upload feed back here

                            ArtSweetAlert.show(
                                context: context,
                                artDialogArgs: ArtDialogArgs(
                                    title: "Thanks For Your Feedback",
                                    type: ArtSweetAlertType.success,
                                    // barrierColor: color.theme.canvasColor,
                                    confirmButtonColor: Colors.blue));
                            _formKey.currentState?.reset();
                          }
                        },
                        child: 'Send'.text.xl.make()),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          _formKey.currentState?.reset();
                        },
                        child: 'Reset'.text.xl.make()),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset("assets/images/feedback.png"),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
