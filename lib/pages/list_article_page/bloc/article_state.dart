part of 'article_bloc.dart';

class ArticlePageState extends Equatable with FormzMixin {
  final List<ArticleModel>? listArticle;
  final List<ArticleModel>? listArticlePopular;
  final List<ArticleModel>? listArticleUpcoming;
  final List<ArticleModel>? listArticleNowPlaying;
  final List<ArticleModel>? listArticleTopRated;
  final ArticleDetailModel? articleDetailModel;
  final List<WatchVideoModel>? listWatchVideo;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? type;
  final int? idMovie;
  final bool? isSearch;
  final bool isLast;
  final int page;
  final String keyword;
  final String next;

  ArticlePageState({
    this.listArticlePopular,
    this.listArticleUpcoming,
    this.listArticleNowPlaying,
    this.listArticleTopRated,
    this.articleDetailModel,
    this.listArticle,
    this.type,
    this.idMovie,
    this.listWatchVideo,
    this.isSearch = false,
    this.submitStatus = FormzStatus.pure,
    this.errorMessage,
    this.isLast = false,
    this.page = 1,
    this.keyword = '',
    this.next = '',
  });

  ArticlePageState copyWith(
      {FormzStatus? submitStatus,
      ArticleDetailModel? articleDetailModel,
      List<WatchVideoModel>? listWatchVideo,
      List<ArticleModel>? listArticle,
      List<ArticleModel>? listArticlePopular,
      List<ArticleModel>? listArticleUpcoming,
      List<ArticleModel>? listArticleNowPlaying,
      List<ArticleModel>? listArticleTopRated,
      bool? isSearch,
      String? type,
      bool? isLast,
      int? page,
      int? idMovie,
      String? keyword,
      String? next,
      String? errorMessage}) {
    return ArticlePageState(
        submitStatus: submitStatus,
        articleDetailModel: articleDetailModel ?? this.articleDetailModel,
        listArticle: listArticle ?? this.listArticle,
        listArticleUpcoming: listArticleUpcoming ?? this.listArticleUpcoming,
        listArticleNowPlaying: listArticleNowPlaying ?? this.listArticleNowPlaying,
        listArticlePopular: listArticlePopular ?? this.listArticlePopular,
        listArticleTopRated: listArticleTopRated ?? this.listArticleTopRated,
        listWatchVideo: listWatchVideo,
        isSearch: isSearch ?? this.isSearch,
        idMovie: idMovie ?? this.idMovie,
        type: type,
        isLast: isLast ?? this.isLast,
        page: page ?? this.page,
        keyword: keyword ?? this.keyword,
        next: next ?? this.keyword,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => type == 'fetching-detail'
      ? [
          submitStatus ?? '',
          articleDetailModel ?? ArticleDetailModel(),
          type ?? ''
        ]
      : type == 'fetching-article'
          ? [
              submitStatus ?? '',
              listArticle ?? [],
              type ?? '',
              page,
              isLast,
              next
            ]
          : [];

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();
}

class ArticlePageInitial extends ArticlePageState {}
