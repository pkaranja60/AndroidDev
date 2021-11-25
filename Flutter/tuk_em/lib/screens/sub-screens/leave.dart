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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Apply For Work Leave',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => setState(() => _currentFirstName = val),
              ),
              SizedBox(
                height: 20,
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
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (val) =>
                    val!.isEmpty ? 'Please enter a valid Email' : null,
                onChanged: (val) => setState(() => _currentEmail = val),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (val) =>
                    val!.isEmpty ? 'Please enter a Phone Number' : null,
                onChanged: (val) => setState(() => _currentNumber = val),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                items: leave.map((leave) {
                  return DropdownMenuItem(
                    value: leave,
                    child: Text('$leave'),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
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
                onChanged: (val) => setState(() => _currentEmail = val),
              ),
              SizedBox(
                height: 20,
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
                    print(_currentFirstName);
                    print(_currentLastName);
                    print(_currentNumber);
                    print(_currentEmail);
                    print(_currentLeave);
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
    );
  }
}
