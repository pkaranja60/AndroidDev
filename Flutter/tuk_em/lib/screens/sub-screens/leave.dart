import 'package:flutter/material.dart';

class LeaveApplication extends StatefulWidget {
  const LeaveApplication({Key? key}) : super(key: key);

  static const routeName = '/leaveapplication';

  @override
  _LeaveApplicationState createState() => _LeaveApplicationState();
}

class _LeaveApplicationState extends State<LeaveApplication> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> leave = [
    '',
    'Annual Leave',
    'Medical Leave',
    'Paternity Leave',
    'Study Leave',
  ];

  String? _currentFirstName;
  String? _currentLastName;
  String? _currentNumber;
  String? _currentEmail;
  String? _currentLeave;
  String? _currentDuration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Apply For Work Leave',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
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
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
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
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
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
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
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
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: _currentLeave ?? '',
                  onChanged: (String? newValue) {
                    setState(() {
                      _currentLeave = newValue;
                    });
                  },
                  items: leave.map((leave) {
                    return DropdownMenuItem(
                      value: leave,
                      child: Text('$leave'),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
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
                SizedBox(
                  height: 10,
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Request Sent')),
                        );
                      }
                      print(_currentFirstName);
                      print(_currentLastName);
                      print(_currentNumber);
                      print(_currentEmail);
                      print(_currentLeave);
                      print(_currentDuration);
                    },
                    child: Text(
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
    );
  }
}
