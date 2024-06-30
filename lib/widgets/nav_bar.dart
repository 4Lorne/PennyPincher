import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  State<NavBar> createState() => _NavBarState();
}

//Handles the state of the navbar and its items
class _NavBarState extends State<NavBar> {
  int currentIndex = 1; // Default selected index, aka Home

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // Use the state's currentIndex
      onTap: (index) {
        currentIndex = index; // Update the state's currentIndex
        widget.onTap(index);
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: 'Budget',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_rounded),
          label: 'Summary',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_sharp),
          label: 'Settings',
        ),
      ],
      selectedItemColor: Colors.green[500],
    );
  }
}
