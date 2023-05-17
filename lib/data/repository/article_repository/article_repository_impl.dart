

import 'package:netplix/data/model/article_detail_model/article_detail_model.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../datasource/remote_datasource.dart';

import '../../model/response_model/response_model.dart';
import '../../model/watch_video_model/watch_video_model.dart';
import 'article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final RemoteDataSource remoteDatasource;

  ArticleRepositoryImpl(this.remoteDatasource);

  @override
  Future<ResponseModel> fetchArticle(
      int page,String start, String end,String category,String keyword, bool isSearch) async {
      return remoteDatasource.fetchArticle(page.toString(),start,end,category,keyword,isSearch);

  }

  @override
  Future<ResponseModel> fetchArticleTv(
      int page,String start, String end,String category,String keyword, bool isSearch) async {
    return remoteDatasource.fetchArticleTv(page.toString(),start,end,category,keyword,isSearch);

  }

  @override
  Future<ArticleDetailModel> readDetailArticle(int id) async {
      return remoteDatasource.readDetailArticle(id);

  }

  @override
  Future<ArticleDetailModel> readDetailArticleTv(int id) async {
    return remoteDatasource.readDetailArticleTv(id);

  }

  @override
  Future<ResponseModel> readDetailVideoArticle(int id) async {
    return remoteDatasource.readDetailVideoArticle(id);

  }

  @override
  Future<ResponseModel> readDetailVideoArticleTv(int id) async {
    return remoteDatasource.readDetailVideoArticleTv(id);

  }
@override
  Future<ResponseModel> readRecommendationsMovieArticle(int id,int page) async {
    return remoteDatasource.readRecommendationsMovieArticle(id,page);

  }

@override
  Future<ResponseModel> readRecommendationsMovieArticleTv(int id,int page) async {
    return remoteDatasource.readRecommendationsMovieArticleTv(id,page);

  }

}
