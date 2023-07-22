// ignore_for_file: prefer_const_constructors, duplicate_ignore, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:helpdesk_apk/models/Chats.dart';
import '/models/settings.dart';
import '../widgets/button.dart';

abstract class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext content) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return Chats();
                },
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff5ac18e),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(content).push(
                MaterialPageRoute(
                  builder: (_) {
                    return Settings();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.settings,
              color: Color(0xff5ac18e),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Stack(
                  children: [
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10),
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://i.pinimg.com/564x/3b/ed/41/3bed41ea8eeaab4fbdc572d2a0ba9cb6.jpg',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Color(0xff5ac18e),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField('Full Name', 'Emmanuel Dadzie', false),
              buildTextField('Email', 'amponsahad0@gmail.com', false),
              buildTextField('Password', '**********', true),
              buildTextField('Location', 'Ghana,Accra', false),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: cancelPrimary,
                    onPressed: () {},
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 2.2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: savePrimary,
                    onPressed: () {},
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 2.2,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeHolder, bool isPasswordtextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.0),
      child: TextField(
        obscureText: isPasswordtextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordtextField
              ? IconButton(
                  onPressed: () {
                    setState(
                      () {
                        showPassword = !showPassword;
                      },
                    );
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeHolder,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
