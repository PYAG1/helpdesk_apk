// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:helpdesk_apk/Pages/auth/login_page.dart';
import '../models/editprofile.dart';
import '../widgets/button.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) {
                return EditProfilePage();
              }),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff5ac18e),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color(0xff5ac18e),
                ),
                SizedBox(width: 10),
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Divider(height: 20, thickness: 1),
            buildAccountOption(context, 'Change Password'),
            buildAccountOption(context, 'Content Settings'),
            buildAccountOption(context, 'Social'),
            buildAccountOption(context, 'Language'),
            buildAccountOption(context, 'Privacy and Security'),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Color(0xff5ac18e),
                ),
                SizedBox(width: 10),
                Text(
                  'Notification',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Divider(height: 20, thickness: 1),
            buildNotificationOption('Dark Mode', valNotify1, onChangeFunction1),
            buildNotificationOption(
                'Account Active', valNotify2, onChangeFunction2),
            buildNotificationOption(
                'Opportunity', valNotify3, onChangeFunction3),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: signoutPrimary,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) {
                          return LoginPage();
                        }),
                      );
                    },
                    child: Text(
                      'SIGN OUT',
                      style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 2.2,
                      ),
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

  Padding buildNotificationOption(
      String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 0.5,
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch(
                activeColor: Color(0xff5ac18e),
                value: value,
                onChanged: (bool newValue) {
                  onChangeMethod(newValue);
                }),
          ),
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (buildContext) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Option 1'),
                    Text('Option 2'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
