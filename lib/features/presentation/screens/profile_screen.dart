import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen();

  @override
   Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'ProfileScreen page'
          ),
        ),
      ),
    );
   }
}