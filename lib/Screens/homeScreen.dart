import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:tourme/Screens/navBroadcast.dart';
import 'package:tourme/Screens/navHome.dart';
import 'package:tourme/Screens/navSubscriptions.dart';
import 'package:tourme/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final screens = [
    const NavHome(),
    const NavBroadcast(),
    const NavSubscriptions()
  ];

  void _onItemTap(int index) {
    _selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
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
              icon: Icon(Icons.add_box),
              label: "Broadcast",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: "Subscriptions")
        ],
      ),
    );
  }
}
