import 'package:netplix/pages/article_detail_page/watch_video_screen.dart';
import 'package:netplix/routes/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/article_detail_page/article_detail_page.dart';
import '../pages/list_article_page/list_article_recommend_vertical.dart';
import '../pages/list_article_page/list_article_vertical.dart';
import '../utils/remote_utils.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.listArticlePage:
        return MaterialPageRoute(
            builder: (_) => ListArticleVertical(
                  category: getCatagoryMovie(settings.arguments),
                  isSearch: isSearchMovie(settings.arguments),
                  isMovie: isMovie(settings.arguments),
                ));
      case RouteName.listArticleRecommendPage:
        return MaterialPageRoute(
            builder: (_) => ListArticleRecommendVertical(
              category: getCatagoryMovie(settings.arguments),
              isSearch: isSearchMovie(settings.arguments),
              articleDetailModel: getMovie(settings.arguments),
              isMovie: isMovie(settings.arguments),
            ));
      case RouteName.articleDetailPage:
        return MaterialPageRoute(
            builder: (_) => ArticleDetailPage(id: getId(settings.arguments), isMovie: isMovie(settings.arguments),));
      case RouteName.watchVideoPreview:
        return MaterialPageRoute(
            builder: (_) =>
                WatchVideoScreen(listWatchVideo: getMovie(settings.arguments),isMovie: isMovie(settings.arguments),));

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