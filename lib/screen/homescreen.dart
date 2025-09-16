import 'package:flutter/material.dart';
import 'package:vikoba_mobileapp/screen/profilescreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  static const List<Widget> _selectedPage = [
    Icon(Icons.payment, size: 150),
    Icon(Icons.local_atm_outlined, size: 150),
    Profilescreen(),
    Icon(Icons.settings, size: 150),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: "marejesho",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_atm_outlined),
            label: "mkopo",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "setting"),
        ],
      ),
      body: Center(child: _selectedPage.elementAt(_selectedIndex)),
    );
  }
}
