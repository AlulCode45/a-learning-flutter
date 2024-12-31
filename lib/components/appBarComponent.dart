import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class Appbarcomponent extends StatelessWidget implements PreferredSizeWidget {
  const Appbarcomponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
      HugeIcon(icon: HugeIcons.strokeRoundedMenu02, color: Colors.black),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpeg'),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
