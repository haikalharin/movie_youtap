part of 'article_bloc.dart';

class ArticlePageState extends Equatable with FormzMixin {
  final List<ArticleModel>? listArticle;
  final ArticleDetailModel? articleDetailModel;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? type;
  final bool? isSearch;
  final bool isLast;
  final int page;
  final String keyword;
  final String next;

  ArticlePageState({
    this.articleDetailModel,
    this.listArticle,
    this.type,
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
      List<ArticleModel>? listArticle,
      bool? isSearch,
      String? type,
      bool? isLast,
      int? page,
      String? keyword,
      String? next,
      String? errorMessage}) {
    return ArticlePageState(
        submitStatus: submitStatus,
        articleDetailModel: articleDetailModel ?? this.articleDetailModel,
        listArticle: listArticle ?? this.listArticle,
        isSearch: isSearch ?? this.isSearch,
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
