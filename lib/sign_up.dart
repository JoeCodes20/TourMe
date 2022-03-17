import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:tourme/otp_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  final _phoneController = TextEditingController();
  String code = "";
  codePicker(code) {
    if (code == "") {
      return const Text("+1");
    } else {
      return Text(code);
    }
  }

  dialCode(code) {
    if (code == "") {
      return code = "+1";
    } else {
      return code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 45, 20, 35),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "images/backIcon.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Enter Your Phone Number.",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              CountryCodePicker(
                onChanged: (country) {
                  setState(() {
                    code = country.dialCode!;
                  });
                },
                showCountryOnly: true,
                initialSelection: "us",
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: SizedBox(
                  width: 230,
                  height: 70,
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                        labelText: "(301) 598-0123",
                        prefix: Padding(
                          padding: const EdgeInsets.all(2),
                          child: codePicker(code),
                        )),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 250,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 60),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) => OtpScreen(
                          phone: _phoneController.text,
                          dialCode: dialCode(code))));
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    primary: Colors.blue[700],
                    padding: const EdgeInsets.fromLTRB(70, 20, 70, 20)),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
