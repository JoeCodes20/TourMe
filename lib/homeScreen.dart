import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:tourme/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTap(int index) {
    _selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("logout"),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => const MyApp()));
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _onItemTap(index);
          });
        },
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.nordic_walking),
              label: "Tours",
              backgroundColor: Colors.white),
        ],
      ),
    );
  }
}
