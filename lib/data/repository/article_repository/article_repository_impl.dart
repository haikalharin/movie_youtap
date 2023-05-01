

import 'package:base_app_new/data/model/article_detail_model/article_detail_model.dart';

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
      int page,String start, String end) async {
      return remoteDatasource.fetchArticle(page.toString(),start,end);

  }

  @override
  Future<ArticleDetailModel> readDetailArticle(int id) async {
      return remoteDatasource.readDetailArticle(id);

  }

  @override
  Future<ResponseModel> readDetailVideoArticle(int id) async {
    return remoteDatasource.readDetailVideoArticle(id);

  }

}
