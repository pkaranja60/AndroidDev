import 'package:employee/screens/sub-screens/profile.dart';
import 'package:flutter/material.dart';

import 'index.dart';
import '../sub-screens/leave.dart';
import '../sub-screens/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final tabs = [
    const Center(child: IndexPage()),
    const Center(child: LeaveApplication()),
    const Center(child: Profile()),
    const Center(child: Settings()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Happy worker',
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
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                backgroundColor: Colors.blue,
                label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                backgroundColor: Colors.blue,
                label: 'Leave Application'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                backgroundColor: Colors.blue,
                label: 'Profile'),
            const BottomNavigationBarItem(
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
