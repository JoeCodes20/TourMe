import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tourme/homeScreen.dart';
import './sign_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Builder(builder: (BuildContext context) {
      return Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "TourMe",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              constraints: const BoxConstraints.expand(height: 500.0),
              width: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/tour.png"), fit: BoxFit.cover)),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    primary: Colors.blue[700],
                    padding: const EdgeInsets.fromLTRB(70, 20, 70, 20)),
                child: const Text("Sign Up")),
            const SizedBox(
              height: 18.0,
            ),
            Opacity(
              opacity: .6,
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (c) => const HomeScreen()));
                  },
                  child: const Text(
                    "Or Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ));
    }));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SignUp(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
