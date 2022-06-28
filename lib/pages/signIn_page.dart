import 'package:ezrisk/pages/widget/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailCotroller = TextEditingController();
  TextEditingController passwordCotroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  // late LoginModel requestModel;

  // @override
  // void initState() {
  //   super.initState();
  //   requestModel = new LoginModel(
  //     email: '',
  //     password: '',
  //   );
  // }

  bool _isObscure = true;
  var confirmPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.only(top: 83),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 250,
                height: 200,
                child: Image.asset(
                  "assets/images/ezrisk_logo.png",
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "SIGN UP",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
              child: Text(
                  "Please sign-in to your account and start the adventure!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 15, right: 15, bottom: 0),
              child: TextFormField(
                validator: (input) =>
                    input!.isValidEmail() ? null : "Please Enter Valid Email.",
                // onSaved: (input) => requestModel.email = input!,
                decoration: InputDecoration(
                  hintText: "Enter Valid Email",
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 15, right: 15, bottom: 0),
              child: TextFormField(
                validator: (input) {
                  confirmPass = input;
                  if (input!.isEmpty)
                    return "Enter Your Passowrd";
                  else if (input.length < 3)
                    return "Password Should Be More Than 3 Char";
                  return null;
                },
                // onSaved: (input) => requestModel.password = input!,

                decoration: InputDecoration(
                  hintText: "Enter Password",
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 15, right: 15, bottom: 0),
              child: TextFormField(
                validator: (input) {
                  if (input != confirmPass) return "Password Does Not Match.";
                  return null;
                },
                // onSaved: (input) => requestModel.password = input!,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter Confirm Password",
                    border: OutlineInputBorder(),
                    labelText: "Confirm Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    )),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.offAllNamed('/login');
                },
                child: Text(
                  "Already Have Account? LogIn Here",
                  style: TextStyle(color: Colors.blue[800]),
                )),
            SizedBox(
              height: 50,
              width: 120,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Get.to(() => HomePage());
                    }
                  },
                  child: Text(
                    "Join US",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    )));
  }
}
