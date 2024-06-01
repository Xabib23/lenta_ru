import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/api/api.dart';

class AppProvider extends ChangeNotifier {
  RssFeed? allNews;

  Future<RssFeed?> setUp() async {
    try {
      allNews = await Api.getNewst();
      return allNews;
    } catch (e) {
      e;
    }
  }
}
