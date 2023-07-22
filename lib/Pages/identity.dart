// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:helpdesk_apk/Pages/auth/login_page.dart';
import '../widgets/button.dart';

class Identity extends StatefulWidget {
  const Identity({super.key});

  @override
  State<Identity> createState() => _IdentityState();
}

class _IdentityState extends State<Identity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Image.asset('lib/Images/logo3.png'),
              ElevatedButton(
                onPressed: () {},
                child: Text('I am a Lecturer'),
                style: Lecturer,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return LoginPage();
                      },
                    ),
                  );
                },
                child: Text('I am a Student'),
                style: Student,
              ),
              Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}
