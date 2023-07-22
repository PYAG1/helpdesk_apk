// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_string_escapes
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk_apk/Pages/auth/signup_page.dart';
import 'package:helpdesk_apk/models/Chats.dart';
import '../../widgets/widget.dart';
import '../../widgets/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  var email = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          key: formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("HelpDesk",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Login now to see what they are talking',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                Image.asset('lib/Images/hdimage.webp'),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Theme.of(context).primaryColor,
                      )),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  validator: (val) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                        ? null
                        : 'please enter a valid email';
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                      )),
                  validator: (val) {
                    if (val!.length < 6) {
                      return 'Password must be at least 6 characters';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: registerPrimary,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return Chats();
                      }));
                    },
                    child: Text('Sign In')),
                SizedBox(height: 10),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Don\'t have an account?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                  TextSpan(
                    text: 'RegisterNow',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return SignupPage();
                        }));
                      },
                  )
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
