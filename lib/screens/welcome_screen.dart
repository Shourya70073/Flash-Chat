// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController c;
  late Animation d;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c = AnimationController(
      duration: Duration(seconds: 2),
      lowerBound: 0,
      vsync: this,
    );
    d = CurvedAnimation(curve: Curves.bounceInOut, parent: c);
    c.forward();
    c.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff332AD5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(0xfff544CDC),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        child: Text(
                          "F L A S H  C H A T",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(0xfff544CDC),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(0xfff544CDC),
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Hero(
                        tag: "logo",
                        child: Container(
                          height: d.value * 100,
                          child: Image(image: AssetImage("images/logo.png")),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "W E L C O M E  T O",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'F L A S H  C H A T !!',
                                textStyle: TextStyle(
                                    color: Color(0xfff332AD5),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 15),
                      child: TextLiquidFill(
                        text: 'Simple, Secure, Reliable messaging.',
                        waveColor: Colors.blueAccent,
                        boxBackgroundColor: Colors.grey.shade900,
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        boxHeight: 50.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 15),
                      child: Text(
                        "With FlashChat, you'll get fast, simple, secure messaging and with end to end encryption, available on phones all over the world.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 10),
                      child: Text(
                        "* Data charges may apply. Contact your provider for details.",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28.0, vertical: 10),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "login");
                        },
                        splashColor: Colors.black,
                        color: Color(0xfff332AD5),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28.0, vertical: 5),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "register");
                        },
                        splashColor: Colors.black,
                        color: Color(0xfff332AD5),
                        child: Text(
                          "REGISTER",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
