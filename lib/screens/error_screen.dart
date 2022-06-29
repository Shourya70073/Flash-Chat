import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class error extends StatelessWidget {
  final e;
  error({this.e});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: "Error",
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ERROR",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text("$e", style: TextStyle(color: Colors.white, fontSize: 15))
            ],
          ),
        )),
      ),
    ));
  }
}
