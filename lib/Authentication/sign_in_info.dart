import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourme/Screens/homeScreen.dart';
import 'package:tourme/extraTools/databaseRef.dart';

class SigninInfo extends StatefulWidget {
  SigninInfo({Key? key}) : super(key: key);

  @override
  State<SigninInfo> createState() => _SigninInfoState();
}

class _SigninInfoState extends State<SigninInfo> {
  final _name = TextEditingController();
  final _artForm = TextEditingController();
  final _userBio = TextEditingController();
  final _currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (c) => const HomeScreen())),
                child: const Text("SKIP"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: Text(
                "Your almost in, just...",
                style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: const Text(
                  "Tell Us Who You Are",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Name",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Container(
                width: double.maxFinite,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: TextFormField(
                    controller: _artForm,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Art form",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Container(
                width: double.maxFinite,
                height: 180,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: TextField(
                    minLines: 5,
                    maxLength: 150,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: _userBio,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Biography",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    StoreUserSignup.submitUserInfo(
                        _name.text.trim(),
                        _artForm.text.trim().toLowerCase(),
                        _userBio.text.trim());
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (c) => const HomeScreen()));
                  },
                  child: Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(color: Colors.blue[700]),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
