// ignore_for_file: unused_import, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:helpdesk_apk/Pages/welcomeScreen.dart';
import 'package:helpdesk_apk/helper/helper_functions.dart';
import 'package:helpdesk_apk/models/Chats.dart';
import 'package:helpdesk_apk/shared/constants.dart';
import './button.dart';
import '../models/editprofile.dart';
import '../Pages/auth/login_page.dart';
import '../Pages/auth/signup_page.dart';
import '../Pages/identity.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLggedInStatus();
  }

  getUserLggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        _isSignedIn = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Constants().primaryColor,
          scaffoldBackgroundColor: Colors.white),
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const Chats() : const LoginPage(),
    );
  }
}
