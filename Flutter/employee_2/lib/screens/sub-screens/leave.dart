import 'package:flutter/material.dart';

class LeaveApplication extends StatefulWidget {
  const LeaveApplication({Key? key}) : super(key: key);

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
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
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
    );
  }
}
