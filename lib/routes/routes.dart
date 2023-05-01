import 'package:base_app_new/routes/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../pages/article_detail_page/article_detail_page.dart';
import '../pages/list_article_page/list_article_vertical.dart';
import '../utils/remote_utils.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.listArticlePage:
        return MaterialPageRoute(
            builder: (_) => ListArticleVertical());
      case RouteName.articleDetailPage:
        return MaterialPageRoute(
            builder: (_) => ArticleDetailPage());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ),
        );
    }
  }

  static Map<String, WidgetBuilder> _getCombinedRoutes() => {};

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}