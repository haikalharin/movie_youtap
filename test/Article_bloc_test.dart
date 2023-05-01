import 'package:base_app_new/data/model/article_detail_model/article_detail_model.dart';
import 'package:base_app_new/data/model/article_model/article_model.dart';
import 'package:base_app_new/data/model/response_model/response_model.dart';
import 'package:base_app_new/data/repository/article_repository/article_repository.dart';
import 'package:base_app_new/pages/list_article_page/bloc/article_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mockito/mockito.dart';

var dataException = null;

var dataArticle = ArticleModel(id: 437049,
    title: "fifa-21",
    originalTitle: "FIFA 21",
    releaseDate: "2022-09-12");
var listData = ResponseModel(
    count: 237,
    next:
    "https://api.rawg.io/api/games?dates=2020-12-21%2C2021-12-21&key=02ef6ba5d13444ee86bad607e8bce3f4&ordering=-released&page=2&page_size=20&platforms=187",
    results: [dataArticle, dataArticle, dataArticle]);
var dataDetail = ArticleDetailModel(
    id: 437049,
    slug: "fifa-21",
    name: "FIFA 21",
    nameOriginal: "FIFA 21");

var dataMap = {
  "id": 437049,
  "slug": "fifa-21",
  "name": "FIFA 21",
  "name_original": "FIFA 21",
};

class ArticleMockRepository extends Mock implements ArticleRepository {

  @override
  Future<ArticleDetailModel> readDetailArticle(int id) async {
    return dataDetail;
  }

  @override
  Future<ResponseModel> fetchArticle(int page, String start, String end) async {
    return listData;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('check_Article_bloc', () {
    ArticleMockRepository? repository;
    ArticlePageBloc bloc = ArticlePageBloc(ArticleMockRepository());
    ArticlePageState state = ArticlePageState();
    List<ArticleModel>listDetail = [];
    var id = 437049,
        submitStatusInProgress,
        submitStatusSuccess,
        type,
        page = 0,
        isLast,
        next,
        articleDetail;
    setUp(() async {
      // var prefs = await SharedPreferences.getInstance()
      repository = ArticleMockRepository();
      bloc = ArticlePageBloc(repository ?? ArticleMockRepository());
    });

    blocTest("_mapArticleFetchEventToState",
        wait: const Duration(seconds: 5),
        build: () {

          submitStatusInProgress = FormzStatus.submissionInProgress;
          submitStatusSuccess = FormzStatus.submissionSuccess;
          type = 'fetching-article';
          page = 2;
          isLast = false;
          next =
          "https://api.rawg.io/api/games?dates=2020-12-21%2C2021-12-21&key=02ef6ba5d13444ee86bad607e8bce3f4&ordering=-released&page=2&page_size=20&platforms=187";
          listDetail = listData.results;

          return bloc;
        },
        act: (bloc) {
          dynamic data = bloc;
          data.add(ArticleFetchEvent(page: 1, isBottomScroll: false));
        },
        expect: () =>
        [
          state.copyWith(submitStatus: submitStatusInProgress, type: type),
          state.copyWith(
              submitStatus: submitStatusSuccess,
              listArticle: listDetail,
              page: page,
              isLast: isLast,
              next: next,
              type: type)
        ]);

    blocTest("_mapArticleReadEventToState",
        wait: const Duration(seconds: 5),
        build: () {


          submitStatusInProgress = FormzStatus.submissionInProgress;
          submitStatusSuccess = FormzStatus.submissionSuccess;
          type = 'fetching-detail';
          articleDetail = dataDetail;
          return bloc;
        },
        act: (bloc) {
          dynamic data = bloc;
          data.add(ArticleReadDetailEvent(id));
        },
        expect: () =>
        [
          state.copyWith(submitStatus: submitStatusInProgress, type: type),
          state.copyWith(
              submitStatus: submitStatusSuccess,
              articleDetailModel: articleDetail,
              type: type)
        ]);
  });
}
