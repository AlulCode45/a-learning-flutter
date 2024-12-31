import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class Searchform extends StatefulWidget {
  final TextEditingController searchController;

  const Searchform({
    super.key,
    required this.searchController,
  });

  @override
  State<Searchform> createState() => _SearchformState();
}

class _SearchformState extends State<Searchform> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.searchController,
      decoration: InputDecoration(
        hintText: 'Cari artikel terbaru..',
        filled: true,
        fillColor: Colors.black.withAlpha(20),
        prefixIcon: Padding(
          padding: EdgeInsets.all(10), // Jarak padding dalam ikon
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedGlobalSearch,
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
