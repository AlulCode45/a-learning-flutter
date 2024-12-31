import 'package:flutter/material.dart';

class Drawercomponent extends StatelessWidget {
  const Drawercomponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.local_fire_department),
            title: Text('Hot article'),
          ),
          ListTile(
            leading: Icon(Icons.show_chart), // Ikon terkait Trading
            title: Text('Trading'),
          ),
          ListTile(
            leading: Icon(Icons.code), // Ikon terkait Coding
            title: Text('Coding'),
          ),
          ListTile(
            leading: Icon(Icons.lightbulb), // Ikon terkait Tips & Trick
            title: Text('Tips & Trick'),
          ),
          ListTile(
            leading: Icon(Icons.login), // Ikon terkait Login
            title: Text('Login'),
          ),
        ],
      ),
    );
  }
}
