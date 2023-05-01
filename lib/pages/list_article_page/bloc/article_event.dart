part of 'article_bloc.dart';

@immutable
abstract class ArticlePageEvent extends Equatable {
  const ArticlePageEvent();

  @override
  List<Object> get props => [];
}

enum SortEnum { asc, desc }

class ArticleFetchEvent extends ArticlePageEvent {
  const ArticleFetchEvent({
    this.page = 0,
    this.isBottomScroll = false,
    this.category = '',
    this.isSearch = false,
    this.isRefresh = false,
    this.keyword = '',
  });

  final int? page;
  final String? category;
  final bool? isSearch;
  final String? keyword;
  final bool isBottomScroll;
  final bool isRefresh;

  @override
  List<Object> get props => [];
}

class ArticleReadDetailEvent extends ArticlePageEvent {
  const ArticleReadDetailEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}

class ArticleVideoDetailEvent extends ArticlePageEvent {
  const ArticleVideoDetailEvent(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}

class ReadRecommendationsMovieArticle extends ArticlePageEvent {
  const ReadRecommendationsMovieArticle(this.id,
      {this.page = 0, this.isRefresh =false,this.isBottomScroll = false});

  final int id;
  final int? page;
  final bool isBottomScroll;
  final bool isRefresh;

  @override
  List<Object> get props => [id];
}

class ArticleDisposeEvent extends ArticlePageEvent {
  const ArticleDisposeEvent();

  @override
  List<Object> get props => [];
}
