import 'package:base_app_new/common/configurations/configurations.dart';
import 'package:base_app_new/data/datasource/remote/url/service_url.dart';

import '../../common/network/http/http_client.dart';
import '../model/article_detail_model/article_detail_model.dart';
import '../model/article_model/article_model.dart';
import '../model/response_model/response_model.dart';
import '../model/watch_video_model/watch_video_model.dart';

class RemoteDataSource {
  final HttpClient httpClient;

  RemoteDataSource({required this.httpClient});




  Future<ResponseModel> fetchArticle(String page,String start, String end,String category,String keyword, bool isSearch) async {
    try {
      Map<String, String> qParams = {
        'page': page,
        'language':'en-US',
        'api_key': Configurations.key,

      };
      final response;
      if(isSearch) {
        qParams = {
          'page': page,
          'language': 'en-US',
          'query': keyword,
          'api_key': Configurations.key,
        };
        response = await httpClient.get(
            "search/${ServiceUrl.movie}",queryParameters: qParams);

      } else{
        response = await httpClient.get(
            "${ServiceUrl.movie}/$category",queryParameters: qParams);

      }
           var data = ResponseModel.fromJson(response, ArticleModel.fromJson);
      return data;
    } catch (e) {
      return ResponseModel.resultsEmpty();
    }
  }

  Future<ArticleDetailModel> readDetailArticle(int id) async {
    try {
      Map<String, String> qParams = {
        'language':'en-US',
        'api_key': Configurations.key,
      };
      final response = await httpClient.get(
          "${ServiceUrl.movie}/$id",queryParameters: qParams);
      var data = ArticleDetailModel.fromJson(response);
      return data;
    } catch (e) {
      return ArticleDetailModel();
    }
  }

  Future<ResponseModel> readDetailVideoArticle(int id) async {
    try {
      Map<String, String> qParams = {
        'language':'en-US',
        'api_key': Configurations.key,
      };
      final response = await httpClient.get(
          "${ServiceUrl.movie}/$id/${ServiceUrl.videos}",queryParameters: qParams);
      var data = ResponseModel.fromJson(response,WatchVideoModel.fromJson);
      return data;
    } catch (e) {
      return ResponseModel.resultsEmpty();
    }
  }
}
