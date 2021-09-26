import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/article_block.dart';

class CategoryView extends StatefulWidget {
  final String category;
  const CategoryView({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late List<CategoryModel> categories;

  late List<ArticleModel> articles;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews news = CategoryNews();
    await news.getNews(widget.category);
    articles = news.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'App',
              style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  //Blogs

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 32),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: ArticleBlock(
                            description: articles[index].description,
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            url: articles[index].url,
                          ),
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
