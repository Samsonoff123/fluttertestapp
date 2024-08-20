import 'package:flutter/material.dart';
import 'package:my_app/features/presentation/screens/conversations_screen.dart';
import 'package:my_app/features/presentation/screens/messages_screen.dart';
import 'package:my_app/features/presentation/screens/profile_screen.dart';

class PrivatWrapperScreen extends StatefulWidget {
  const PrivatWrapperScreen();

  @override
  State<PrivatWrapperScreen> createState() => _PrivatWrapperScreen();
}

class _PrivatWrapperScreen extends State<PrivatWrapperScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        ConversationsScreen(),
        MessagesScreen(),
        ProfileScreen()
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            label: 'Home',
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
          ),
          NavigationDestination(
            label: 'Messages',
            selectedIcon: Icon(Icons.message),
            icon: Icon(Icons.message_outlined),
          ),
          NavigationDestination(
            label: 'Profile',
            selectedIcon: Icon(Icons.person_outlined),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}