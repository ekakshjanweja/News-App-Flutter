import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/article_block.dart';
import 'package:news_app/widgets/category_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<CategoryModel> categories;

  late List<ArticleModel> articles;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNews();
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
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  children: [
                    //Categories
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: CategoryTile(
                                categoryName: categories[index].categoryName,
                                imageUrl: categories[index].imageUrl,
                              ),
                            );
                          }),
                    ),

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
            ),
    );
  }
}
