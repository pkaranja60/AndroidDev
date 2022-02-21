import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class LeaveApplication extends StatefulWidget {
  const LeaveApplication({Key? key}) : super(key: key);

  @override
  _LeaveApplicationState createState() => _LeaveApplicationState();
}

class _LeaveApplicationState extends State<LeaveApplication> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPhoneNo = TextEditingController();
  final controllerLeaveType = TextEditingController();
  final controllerDuration = TextEditingController();

  String? _currentFirstName;
  String? _currentLastName;
  String? _currentNumber;
  String? _currentEmail;
  String? _currentLeave;
  String? _currentDuration;

  File? file;
  ImagePicker image = ImagePicker();
  String url = "";
  var name = "";
  var color1 = Colors.redAccent[700];

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  get auth => null;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Text(
                    'Apply For Work Leave',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controllerFirstName,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    onChanged: (val) => setState(() => _currentFirstName = val),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controllerLastName,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    onChanged: (val) => setState(() => _currentLastName = val),
                  ),
                  const SizedBox(
                    height: 25,
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
                    onChanged: (val) => setState(() => _currentEmail = val),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controllerPhoneNo,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid Phone number';
                      }
                      return null;
                    },
                    onChanged: (val) => setState(() => _currentNumber = val),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controllerLeaveType,
                    decoration: const InputDecoration(
                      labelText: 'Type of Leave',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the type of leave';
                      }
                      return null;
                    },
                    onChanged: (val) => setState(() => _currentDuration = val),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controllerDuration,
                    decoration: const InputDecoration(
                      labelText: 'Duration',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (val) => setState(() => _currentDuration = val),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: MaterialButton(
                      color: Colors.lightBlue,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FirebaseFirestore.instance
                              .collection('employees')
                              .add({
                            "First name": controllerFirstName.text,
                            "Last Name": controllerLastName.text,
                            "Phone Number": int.parse(controllerPhoneNo.text),
                            "Email": controllerEmail.text,
                            "Type of leave": controllerLeaveType.text,
                            "Duration": controllerDuration.text
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Request Sent, Please upload relevant documents')),
                          );
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
          child: const Icon(Icons.upload_file),
          openCloseDial: isDialOpen,
          backgroundColor: Colors.blue,
          overlayOpacity: 0.5,
          spacing: 15,
          spaceBetweenChildren: 15,
          closeManually: true,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.picture_as_pdf_outlined),
                label: 'PDF',
                backgroundColor: Colors.blue,
                onTap: () {
                  getfile();
                  print('document Tapped');
                }),
            SpeedDialChild(
                child: const Icon(Icons.image_outlined),
                label: 'Scanned Image',
                onTap: () {
                  getImage();
                  print('image Tapped');
                }),
          ],
        ),
      ),
    );
  }

  getfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File c = File(result.files.single.path.toString());
      setState(() {
        file = c;
        name = result.names.toString();
      });
      uploadFile();
    }
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
    if (file != null) {
      uploadFile();
    }
  }

  uploadFile() async {
    try {
      var imagefile =
          FirebaseStorage.instance.ref().child('Documents').child('/$name');
      UploadTask task = imagefile.putFile(file!);
      TaskSnapshot snapshot = await task.snapshot;
      url = await snapshot.ref.getDownloadURL();

      print(url);
      if (url != null && file != null) {
        Fluttertoast.showToast(
          msg: 'Upload Successful',
          textColor: Colors.lightBlueAccent,
        );
      } else {
        Fluttertoast.showToast(
          msg: 'Something went wrong',
          textColor: Colors.redAccent,
        );
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        textColor: Colors.redAccent,
      );
    }
  }
}
