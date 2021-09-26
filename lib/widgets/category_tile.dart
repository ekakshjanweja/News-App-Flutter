import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/views/category_news.dart';

class CategoryTile extends StatelessWidget {
  final String categoryName;
  final String imageUrl;

  const CategoryTile({
    Key? key,
    required this.categoryName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryView(category: categoryName.toLowerCase());
        }));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            categoryName,
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
