import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tourme/Authentication/sign_in_info.dart';
import 'package:tourme/Screens/homeScreen.dart';
import './Authentication/sign_up.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Builder(builder: (BuildContext context) {
      return Scaffold(
        body: Column(
          children: [
            Container(
                width: double.maxFinite,
                height: 500,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(1, -1),
                      end: Alignment(1, .5),
                      colors: [Colors.blue, Colors.white10],
                      stops: [0.0, 0.9]),
                  color: Colors.blue,
                )),
            const SizedBox(
              height: 80,
            ),
            // ContentCreators Streaming Platform
            //Support your favorite creators
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    primary: Color.fromARGB(255, 57, 57, 57),
                    padding: const EdgeInsets.fromLTRB(70, 20, 70, 20)),
                child: const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 25.0,
            ),
            Opacity(
              opacity: .6,
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => SigninInfo()));
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
      );
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
