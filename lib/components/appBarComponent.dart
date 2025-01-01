import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class Appbarcomponent extends StatelessWidget implements PreferredSizeWidget {
  const Appbarcomponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: Scaffold.of(context).openDrawer,
            child: HugeIcon(
                icon: HugeIcons.strokeRoundedMenu02, color: Colors.black),
          );
        },
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
