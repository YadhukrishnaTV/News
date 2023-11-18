import 'package:flutter/material.dart';
import 'package:news/view/home/home.dart';
import 'package:news/view/profile/profile.dart';
import 'package:news/view/search/search.dart';





class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List _screens = [
      home(),
      explore(),
      Profile()
    ];
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          items: [
           BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search),
             label: "Search"),
            BottomNavigationBarItem( icon: Icon(Icons.account_circle),
                activeIcon: Icon(Icons.account_circle),
                label: "Profile"
                ),
              
              
               
            
          ]),
    );
  }
}

