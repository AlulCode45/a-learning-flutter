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
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail image
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            clipBehavior: Clip.hardEdge,
            child: thumbnail != null
                ? Image.network(
              thumbnail!,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(Icons.error, color: Colors.red),
                );
              },
            )
                : Center(
              child: Icon(Icons.image, color: Colors.white),
            ),
          ),

          SizedBox(height: 10), // Spacing between image and text

          // Category and Author wrapped
          Wrap(
            spacing: 5.0, // Horizontal spacing between items
            runSpacing: 5.0, // Vertical spacing when wrapped
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

          SizedBox(height: 8), // Spacing between Wrap and Title

          // Title
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 5), // Spacing between Title and Date

          // Created at
          Text(
            createdAt,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }
}
