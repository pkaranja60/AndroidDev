import 'package:flutter/material.dart';
import 'package:tuk_em/screens/sub-screens/leave.dart';
import 'package:tuk_em/screens/sub-screens/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: Text('Home')),
    Center(child: LeaveApplication()),
    Center(child: Text('Profile')),
    Center(child: Settings()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tuk_EM',
        ),
        backgroundColor: Colors.green[600],
        centerTitle: true,
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 13,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                backgroundColor: Colors.blue,
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                backgroundColor: Colors.blue,
                label: 'Leave Application'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                backgroundColor: Colors.blue,
                label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                backgroundColor: Colors.blue,
                label: 'Settings')
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
