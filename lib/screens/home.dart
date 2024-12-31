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
      'thumbnail': 'https://www.computerhope.com/jargon/p/program.png',
      'category': 'coding',
      'author': 'acode',
    },
    {
      'title': 'How to Build a Responsive UI in Flutter',
      'createdAt': 'Jan 15 - 5 min read',
      'thumbnail': 'https://cdn0-production-images-kly.akamaized.net/bzky3jYn9h2VeCewid1oc-fJJ-s=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2962989/original/075702800_1573353762-20190326113607-Digital-Options-With-Olymp-Trade-Online-Trading-Made-Simple-2-4000pxW-X-2670pxH.jpeg',
      'category': 'trading',
      'author': 'acode',
    },
    {
      'title': 'State Management Simplified with Provider',
      'createdAt': 'Jan 18 - 10 min read',
      'thumbnail': 'https://codingweek.org/wp-content/uploads/2019/08/christopher-robin-ebbinghaus-pgSkeh0yl8o-unsplash.jpg',
      'category': 'coding',
      'author': 'acode',
    },
    {
      'title': 'Understanding Flutter Animations for Beginners',
      'createdAt': 'Jan 22 - 6 min read',
      'thumbnail': 'https://miro.medium.com/v2/resize:fit:1200/1*FJvCYBw0eF8COerUSM5Z4A.png',
      'category': 'coding',
      'author': 'developer123',
    },
    {
      'title': 'Getting Started with Cryptocurrency in 2024',
      'createdAt': 'Jan 25 - 7 min read',
      'thumbnail': 'https://www.coindesk.com/resizer/KN_RjtUVQw3s1w8uY95ZsdmFDd0=/800x800/center/middle/cloudfront-us-east-1.images.arcpublishing.com/coindesk/ZN2YVEXD7TGVZONAI73A7USKFY.jpg',
      'category': 'trading',
      'author': 'cryptoGuru',
    },
    {
      'title': 'Why You Should Learn Flutter in 2024',
      'createdAt': 'Jan 28 - 9 min read',
      'thumbnail': 'https://cdn.mos.cms.futurecdn.net/LwARszfuEqe7Bh5n1wN2Fb.jpg',
      'category': 'coding',
      'author': 'acode',
    },
    {
      'title': 'The Future of AI in Mobile App Development',
      'createdAt': 'Feb 2 - 12 min read',
      'thumbnail': 'https://images.unsplash.com/photo-1573497019597-977c0f7b4ba9',
      'category': 'coding',
      'author': 'techyGuru',
    }
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
                    thumbnail: article['thumbnail'],
                    author: article['author']!,
                    category: article['category']!,
                    createdAt: article['createdAt']!,
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
