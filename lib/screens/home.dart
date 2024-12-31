import 'package:a_learning2/components/articleList.dart';
import 'package:a_learning2/components/searchForm.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> articles = [
    {
      'title': 'Exploring the World of Flutter Widgets',
      'createdAt': 'Jan 12 - 8 min read',
      'thumbnail': 'https://www.computerhope.com/jargon/p/program.png'
    },
    {
      'title': 'How to Build a Responsive UI in Flutter',
      'createdAt': 'Jan 15 - 5 min read',
      'thumbnail': 'https://cdn0-production-images-kly.akamaized.net/bzky3jYn9h2VeCewid1oc-fJJ-s=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2962989/original/075702800_1573353762-20190326113607-Digital-Options-With-Olymp-Trade-Online-Trading-Made-Simple-2-4000pxW-X-2670pxH.jpeg'
    },
    {
      'title': 'State Management Simplified with Provider',
      'createdAt': 'Jan 18 - 10 min read',
      'thumbnail': 'https://codingweek.org/wp-content/uploads/2019/08/christopher-robin-ebbinghaus-pgSkeh0yl8o-unsplash.jpg'
    },
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Searchform(searchController: _searchController),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return Articlelist(
                    title: article['title']!,
                    createdAt: article['createdAt']!,
                    thumbnail: article['thumbnail'],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
