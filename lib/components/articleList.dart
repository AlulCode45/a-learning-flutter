import 'package:flutter/material.dart';

class Articlelist extends StatelessWidget {
  final String title;
  final String? thumbnail;
  final String createdAt;
  final String category;
  final String author;

  const Articlelist({
    super.key,
    required this.title,
    required this.createdAt,
    this.thumbnail,
    required this.category,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        spacing: 20,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              height: 150,
              clipBehavior: Clip.hardEdge,
              // Memastikan isi mengikuti border radius
              child: Image.network(
                thumbnail!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Gambar selesai dimuat
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null, // Progress jika diketahui
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child:
                        Icon(Icons.error, color: Colors.red), // Icon jika error
                  );
                },
              ),
            ),
          ),
          Flexible(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 5,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: Text(
                      '#$category',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Text(
                      '@$author',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(createdAt)
            ],
          ))
        ],
      ),
    );
  }
}
