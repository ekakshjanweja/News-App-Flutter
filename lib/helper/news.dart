import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=002b7f8a8bb24e5389773ddf28e1f094';

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok' && jsonData['status'] != 403) {
      jsonData['articles'].forEach((element) async {
        if (element['urlToImage'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            content: element['content'],
            description: element['description'],
            title: element['title'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=002b7f8a8bb24e5389773ddf28e1f094';

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok' && jsonData['status'] != 403) {
      jsonData['articles'].forEach((element) async {
        if (element['urlToImage'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            content: element['content'],
            description: element['description'],
            title: element['title'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
