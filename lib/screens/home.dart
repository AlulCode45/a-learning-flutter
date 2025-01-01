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
    final articlesSnapshot = await _articlesSnapshot;
    final articles = articlesSnapshot.value as Map<dynamic, dynamic>;

    // Ambil data artikel dan user info berdasarkan authorUid
    List<Map<String, dynamic>> articlesList = [];

    for (var article in articles.values) {
      final authorUid = article['authorUid'];
      final userSnapshot = await dbService.getUserData(authorUid);
      final userData = userSnapshot.value != null
          ? (userSnapshot.value as Map<dynamic, dynamic>).values.first
          : null;

      if (userData != null) {
        articlesList.add({
          'id': article['id'],
          'title': article['title'],
          'createdAt': article['createdAt'],
          'thumbnail': article['thumbnail'],
          'category': article['category'],
          'author': userData['displayName'],
        });
      }
    }

    return articlesList;
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
                      return Articlelist(
                        title: article['title']!,
                        thumbnail: article['thumbnail']!,
                        author: article['author']!,
                        category: article['category']!,
                        createdAt: article['createdAt']!,
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
