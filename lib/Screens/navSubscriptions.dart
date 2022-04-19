import 'package:flutter/material.dart';

class NavSubscriptions extends StatefulWidget {
  const NavSubscriptions({Key? key}) : super(key: key);

  @override
  State<NavSubscriptions> createState() => _NavSubscriptionsState();
}

class _NavSubscriptionsState extends State<NavSubscriptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                width: double.maxFinite,
                height: 60,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
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
                width: double.maxFinite,
                height: 640,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: (135 / 200),
                  children: [
                    Container(
                        width: 100,
                        height: 800,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.white,
                          child: Stack(
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: const Image(
                                  image: AssetImage("images/walking.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              const Positioned.fill(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 130),
                                        child: Text(
                                          "Joseph Adeyanju",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ))),
                              Positioned(
                                  bottom: 20,
                                  left: 10,
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.thumb_up,
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
                                  top: 20,
                                  right: 10,
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: Colors.white,
                                  )),
                              Positioned(
                                  bottom: 13,
                                  right: 10,
                                  child: Container(
                                    width: 60,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black54),
                                    child: const Icon(
                                      Icons.inbox,
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          ),
                        )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
