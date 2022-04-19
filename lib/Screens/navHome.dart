import "package:flutter/material.dart";
import 'package:tourme/Screens/searchScreen.dart';

class NavHome extends StatefulWidget {
  const NavHome({Key? key}) : super(key: key);

  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
              width: double.maxFinite,
              height: 45,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Positioned(
                      left: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => const SearchScreen()));
                        },
                        child: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                      )),
                  Positioned(
                      top: 10,
                      right: 70,
                      child: GestureDetector(
                        onTap: () {},
                        child: Stack(
                          fit: StackFit.loose,
                          children: [
                            const Icon(
                              Icons.inbox,
                              size: 30,
                            ),
                            Container(
                              width: 15,
                              height: 15,
                              margin: const EdgeInsets.only(left: 15),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 244, 67, 54),
                                shape: BoxShape.circle,
                              ),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                    top: 5,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SizedBox(
                              width: 60,
                              height: 60,
                              child: ClipOval(
                                child: Image.asset(
                                  "images/maleAvatar.png",
                                ),
                              ))),
                    ),
                  ),
                ],
              )),
          Container(
            alignment: Alignment.center,
            child: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Opacity(
                opacity: .7,
                child: Text(
                  "For You",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 615,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 180,
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: Colors.white,
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          Positioned(
                              child: Container(
                            width: double.maxFinite,
                            height: 100,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("images/mountain.jpeg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(5)),
                          )),
                          Positioned(
                              child: Container(
                            width: double.maxFinite,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(5)),
                          )),
                          Positioned(
                              top: 10,
                              left: 10,
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "10K",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              )),
                          const Positioned(
                              right: 10,
                              top: 5,
                              child: Icon(
                                Icons.more_horiz,
                                size: 25,
                                color: Colors.white,
                              )),
                          Positioned(
                              top: 60,
                              left: 8,
                              child: Stack(
                                  fit: StackFit.loose,
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 108,
                                      height: 108,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage("images/Jane.jpeg"),
                                            fit: BoxFit.cover),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ])),
                          Positioned(
                              right: 10,
                              top: 40,
                              child: Container(
                                width: 220,
                                height: 50,
                                alignment: Alignment.topRight,
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 4, top: 8),
                                  child: Text(
                                    "Joseph Adeyanju",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              )),
                          Positioned(
                              right: 10,
                              top: 60,
                              child: Container(
                                width: 220,
                                height: 50,
                                alignment: Alignment.topRight,
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 4, top: 8),
                                  child: Text(
                                    "@alphascor",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              )),
                          Positioned(
                              bottom: 15,
                              right: 10,
                              child: Container(
                                width: 220,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue),
                                child: Stack(
                                  fit: StackFit.loose,
                                  children: [
                                    Positioned(
                                        child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: const [
                                          Text(
                                            "Subscribe",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                                color: Colors.white),
                                          ),
                                          VerticalDivider(
                                            width: 10,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "\$14.99",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
