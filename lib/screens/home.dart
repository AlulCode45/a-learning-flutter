import 'package:a_learning2/components/articleList.dart';
import 'package:a_learning2/components/searchForm.dart';
import 'package:a_learning2/services/databaseService.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  final DatabaseService dbService = DatabaseService();
  late Future<DataSnapshot> _articlesSnapshot;
  late Future<List<Map<String, dynamic>>> _articlesData;

  @override
  void initState() {
    super.initState();
    _articlesSnapshot = dbService.readData('contents');
    _articlesData = _getArticlesData();
  }

  Future<List<Map<String, dynamic>>> _getArticlesData() async {
    try {
      final contentsSnapshot = await _articlesSnapshot;

      if (contentsSnapshot.value == null) {
        print("No contents found");
        return [];
      }

      final data = contentsSnapshot.value;

      if (data is List) {
        print("Data is a List: $data");

        List<Map<String, dynamic>> contentsList = data
            .where((item) => item is Map) // Validasi tipe elemen
            .map((item) => Map<String, dynamic>.from(item as Map))
            .toList();

        print("Contents List: $contentsList");
        return contentsList;
      } else {
        print("Unexpected data structure: ${data.runtimeType}");
        return [];
      }
    } catch (e) {
      print('Error fetching contents: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Searchform(searchController: _searchController),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _articlesData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No articles available'));
                  }

                  final articles = snapshot.data!;

                  return ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];

                      // Pastikan setiap properti memiliki nilai default jika tidak ada
                      final title = article['title'] ?? 'No title';
                      final thumbnail = article['thumbnail'] ??
                          'https://via.placeholder.com/150';
                      final author = article['author'] ?? 'Unknown author';
                      final category = article['category'] ?? 'Uncategorized';
                      final createdAt = article['createdAt'] ?? 'Unknown date';

                      return Articlelist(
                        title: title,
                        thumbnail: thumbnail,
                        author: author,
                        category: category,
                        createdAt: createdAt,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
