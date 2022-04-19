import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tourme/Authentication/otp_screen.dart';
import 'package:tourme/Authentication/sign_in_info.dart';
import 'package:tourme/Screens/homeScreen.dart';
import 'package:tourme/extraTools/databaseRef.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  validateUsername() async {
    try {
      final usernameCollection =
          FirebaseFirestore.instance.collection("usernames");
      final database = FirebaseDatabase.instance.ref().child("/usernames");
      final response = await usernameCollection
          .doc(_usernameController.text.trim().toLowerCase())
          .get()
          .then((event) {
        if (event.data() != null) {
          return event.data();
        }
      });
      print(response);
      // final response = await database
      //     .child(_usernameController.text.trim().toLowerCase())
      //     .once()
      //     .then((event) {
      //   final dataSnapshot = event.snapshot;
      //   if (dataSnapshot.value != null) {
      //     return dataSnapshot.value;
      //   }
      // });
      return response;
    } catch (e) {
      print("err $e");
      return null;
    }
  }

  Future signup() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      StoreUserSignup.storeUserData(
          _usernameController.text.trim().toLowerCase(),
          _emailController.text.trim().toLowerCase(),
          _passwordController.text.trim());
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (c) => SigninInfo()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message!),
        duration: const Duration(seconds: 7),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 45, 20, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "images/backIcon.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
                  child: Container(
                    width: double.maxFinite,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 20),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 3
                            ? "Username needs to exceed 3 characters"
                            : null,
                        controller: _usernameController,
                        decoration: InputDecoration(
                            hintText: "Username",
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: const Text("Username"),
                                            content: const Text(
                                                "Your user name is how you will appair on NoteBlue and how others will search for you. You can always change it later."),
                                            actions: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text("CANCEL")),
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text("OK"))
                                            ],
                                          ));
                                },
                                child: const Icon(Icons.info))),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Container(
                    width: double.maxFinite,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 20),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? "Enter a valid email"
                                : null,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Container(
                    width: double.maxFinite,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                            ? "Password lenght needs to exceed 5 characters"
                            : null,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 180,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      final validate = await validateUsername();
                      if (validate != null &&
                          _usernameController.text.length > 0) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "Username has been taken please try a different one"),
                            duration: Duration(seconds: 5)));
                      } else {
                        return signup();
                      }
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: Colors.blue[700],
                        padding: const EdgeInsets.fromLTRB(70, 20, 70, 20)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
