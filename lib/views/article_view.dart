import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  const ArticleView({
    Key? key,
    required this.blogUrl,
  }) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> completer = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: (WebViewController webVeiwController) {
            completer.complete(webVeiwController);
          },
        ),
      ),
    );
  }
}
