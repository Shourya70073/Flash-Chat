// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseFirestore st = FirebaseFirestore.instance;
  FirebaseAuth a = FirebaseAuth.instance;
  var loginuser;
  late String message;
  final control = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }

  void getuser() {
    loginuser = a.currentUser;
  }
  // void getmessage() async {
  //   await for (var s in st.collection("messages").snapshots()) {
  //     for (var m in s.docs) {
  //       print(m.data());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                print(a.currentUser!.email);
                a.signOut();
                Navigator.pop(context);
                // getmessage();
              }),
        ],
        title: Text('⚡️ Chat'),
        backgroundColor: Color(0xfff332AD5),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: st.collection("messages").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      color: Colors.blue,
                    );
                  }
                  final message = snapshot.data!.docs.reversed;
                  List<bubble> mwid = [];
                  for (var m in message) {
                    var text = m["text"];
                    var sender = m["sender"];
                    print(sender);
                    print(loginuser.email);
                    bool q = false;
                    if (sender == loginuser.email) {
                      q = true;
                    }
                    bubble t = bubble(text: text, sender: sender, q: q);
                    mwid.add(t);
                  }
                  return Expanded(
                    child: (ListView(
                      reverse: true,
                      children: mwid,
                    )),
                  );
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: control,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      control.clear();
                      try {
                        var u = await st.collection("messages").add({
                          "sender": (loginuser.email),
                          "text": message,
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class bubble extends StatelessWidget {
  final q;
  late final text;
  late final sender;
  bubble({@required this.text, @required this.sender, this.q});

  @override
  Widget build(BuildContext context) {
    return (Column(
        crossAxisAlignment:
            q ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Text(
              sender,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 5.0,
              borderRadius: q
                  ? BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))
                  : BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
              color: q ? Color(0xfff332AD5) : Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          )
        ]));
  }
}
