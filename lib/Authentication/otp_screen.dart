import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tourme/Authentication/sign_in_info.dart';
import 'package:tourme/Screens/homeScreen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.phone, required this.dialCode})
      : super(key: key);
  final String phone;
  final String dialCode;

  // OtpScreen(this.phone)
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpCodeController = TextEditingController();
  final FocusNode _otpCodeFocus = FocusNode();
  String? verificationCode;

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.dialCode + widget.phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          FirebaseAuth.instance.signInWithCredential(credential).then((value) {
            if (value.user != null) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => const HomeScreen()));
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message.toString()),
            duration: const Duration(seconds: 5),
          ));
        },
        codeSent: (String vID, int? resendToken) {
          setState(() {
            verificationCode = vID;
          });
        },
        codeAutoRetrievalTimeout: (String vID) {
          setState(() {
            verificationCode = vID;
          });
        },
        timeout: const Duration(seconds: 60));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset(
                      "images/backIcon.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 15),
              child: const Text(
                "Verification",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4),
              child: Text(
                "Enter the code sent to ${widget.dialCode}-${widget.phone}",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
              ),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (value) {
                  print(value);
                },
                pastedTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                focusNode: _otpCodeFocus,
                controller: _otpCodeController,
                onCompleted: (pin) async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                            verificationId: verificationCode!, smsCode: pin))
                        .then((value) {
                      if (value.user != null) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) => HomeScreen()));
                      }
                    });
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Invalid Verification Code"),
                      duration: Duration(seconds: 5),
                    ));
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 200),
              child: Row(
                children: [
                  const Text(
                    "Didn't receive the code?",
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      verifyPhoneNumber();
                    },
                    child: const Text(
                      " RESEND!",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
