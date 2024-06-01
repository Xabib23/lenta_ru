import 'package:flutter/material.dart';
import 'package:news_app/domain/router/routes.dart';
import 'package:news_app/ui/pages/detail_page.dart';
import 'package:news_app/ui/pages/home_page.dart';

final class AppNavigator {
  static const initialPage = AppRoutes.homePage;

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.homePage: (context) => const HomePage(),
    AppRoutes.detailPage: (context) => const DetailPage(),
  };
}
