import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final controllerFullName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerNumber = TextEditingController();
  final controllerRole = TextEditingController();

  String fullName = "";
  String email = "";
  String number = "";
  String role = '';

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: profileView());
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: const <Widget>[
                Text(
                  'Profile Details',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 50),
        Expanded(
            child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controllerFullName,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() => fullName = val);
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controllerEmail,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() => email = val);
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controllerNumber,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() => number = val);
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controllerRole,
                      decoration: const InputDecoration(
                        labelText: 'Role',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.recent_actors),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please state your position';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() => role = val);
                      }),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Your Work Profile has been Updated')),
                          );
                        }
                      },
                      color: Colors.purpleAccent[100],
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
