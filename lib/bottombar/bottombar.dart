import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth_pin_biometric/setting_view/setting_page.dart';
import 'package:page_transition/page_transition.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
  static Route route() {
    if (Platform.isAndroid) {
      // Android-specific code
      return PageTransition<void>(
        type: PageTransitionType.rightToLeft,
        child: MyBottomBar(),
      );
    } else {
      // iOS-specific code
      return MaterialPageRoute<void>(
        builder: (_) => MyBottomBar(),
      );
    }
  }
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Business',
      style: optionStyle,
    ),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Text(
      //           '',
      //           style: Theme.of(context).textTheme.titleLarge,
      //         ),
      //         backgroundColor: Colors.transparent,
      //     ),
      body: Center(
        //  child: _widgetOptions[_selectedIndex],
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Security',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
