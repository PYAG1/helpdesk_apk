// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_string_escapes, non_constant_identifier_names, unused_field
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk_apk/Pages/auth/login_page.dart';
import 'package:helpdesk_apk/Service/auth_service.dart';
import 'package:helpdesk_apk/models/Chats.dart';
import '../../widgets/widget.dart';
import '../../widgets/button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isLoading = false;
  final formkey = GlobalKey<FormState>();
  var fullname = '';
  var email = '';
  var password = '';
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor))
          : SingleChildScrollView(
              child: SafeArea(
                key: formkey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("HelpDesk",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('Register now if you are new here',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      Image.asset('lib/Images/hdimage2.webp'),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Fullname',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xff5ac18e),
                            )),
                        onChanged: (val) {
                          setState(() {
                            fullname = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return 'Name cannot be empty';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
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
                          child: Text('Register')),
                      SizedBox(height: 10),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        TextSpan(
                          text: 'Login Now',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return LoginPage();
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

  SignupPage() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullname, email, password)
          .then((value) {
        if (value == true) {
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
