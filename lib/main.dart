import 'package:chat_app_tharwat/firebase_options.dart';
import 'package:chat_app_tharwat/screens/chat_screen.dart';
import 'package:chat_app_tharwat/screens/login_screen.dart';
import 'package:chat_app_tharwat/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.id : (context)=>LoginScreen(),
        RegisterScreen.id : (context)=>RegisterScreen(),
        ChatScreen.id:(context)=>ChatScreen(),
      },

      initialRoute: LoginScreen.id,
    );
  }
}
