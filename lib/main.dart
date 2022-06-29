import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "welcome",
      routes: {
        "welcome": (context) => WelcomeScreen(),
        "login": (context) => LoginScreen(),
        "chat": (context) => ChatScreen(),
        "register": (context) => RegistrationScreen(),
        "error":(context) => error(),
      },
    );
  }
}
