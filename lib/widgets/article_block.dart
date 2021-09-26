import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';

class ArticleBlock extends StatelessWidget {
  final String? imageUrl, title, description, url;
  const ArticleBlock({
    Key? key,
    required this.description,
    required this.imageUrl,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ArticleView(blogUrl: url!);
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(imageUrl: imageUrl!)),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  title!,
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight.withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  description!,
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight.withOpacity(0.5),
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
