import 'package:a_learning2/components/searchForm.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [Searchform(searchController: _searchController)],
        ),
      ),
    );
  }
}
