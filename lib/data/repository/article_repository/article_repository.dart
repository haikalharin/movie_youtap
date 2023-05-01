
import 'package:base_app_new/data/model/watch_video_model/watch_video_model.dart';

import '../../model/article_detail_model/article_detail_model.dart';
import '../../model/response_model/response_model.dart';

abstract class ArticleRepository {
  Future<ResponseModel> fetchArticle(int page,String start, String end,String category,String keyword, bool isSearch);

  Future<ArticleDetailModel> readDetailArticle(int id);

  Future<ResponseModel> readDetailVideoArticle(int id);

  Future<ResponseModel> readRecommendationsMovieArticle(int id,int page);
}
