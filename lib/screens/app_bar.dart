import 'package:e_commerce/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/screens/login.dart';

class Appbar extends StatefulWidget {
  final int initialIndex;
  // final loginParameters;
  const Appbar({
    Key? key,
    this.initialIndex = 0,
    //  required this.loginParameters
  }) : super(key: key);

  @override
  State<Appbar> createState() => _Appbar();
}

class _Appbar extends State<Appbar> {
  // int _selectedIndex = 0;
  int _currentIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _screens = [
    Signup(),
    Login(name: 'abc', email: 'abc@gmail.com', password: '123456'),
    // Instantiate Login without passing parameters
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('BottomNavigationBar Sample'),
          ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          print("index $index");
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Signup',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Login',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: 'Settings',
          // ),
        ],
      ),
    );
  }
}














 // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  // ];

    // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });

  //   // if (index == 0) {
  //   //   Navigator.of(context)
  //   //       .push(MaterialPageRoute(builder: (context) => Signup()));
  //   // } else if (index == 1) {
  //   //   Navigator.of(context)
  //   //       .push(MaterialPageRoute(builder: (context) => Login()));
  //   // }
  // }

   // Center(
    //   child: _screens.elementAt(_selectedIndex),
    // ),
    // bottomNavigationBar: BottomNavigationBar(
    //   items: const <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.home),
    //       label: 'signup',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.business),
    //       label: 'Login',
    //     ),
    //     // BottomNavigationBarItem(
    //     //   icon: Icon(Icons.school),
    //     //   label: 'School',
    //     // ),
    //   ],
    //   currentIndex: _selectedIndex,
    //   selectedItemColor: Colors.amber[800],
    //   onTap: _onItemTapped,
    // ),
    // );