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
    this.isMovie = true,
    this.keyword = '',
  });

  final int? page;
  final String? category;
  final bool? isSearch;
  final String? keyword;
  final bool isBottomScroll;
  final bool isRefresh;
  final bool isMovie;

  @override
  List<Object> get props => [];
}

class ArticleReadDetailEvent extends ArticlePageEvent {
  const ArticleReadDetailEvent(this.id,{ this.isMovie = true});
  final int id;
  final bool isMovie;

  @override
  List<Object> get props => [id];
}

class ArticleVideoDetailEvent extends ArticlePageEvent {
  const ArticleVideoDetailEvent(this.id,{ this.isMovie = true});

  final int id;
  final bool isMovie;
  @override
  List<Object> get props => [id];
}

class ReadRecommendationsMovieArticle extends ArticlePageEvent {
  const ReadRecommendationsMovieArticle(this.id,
      {this.page = 0,
      this.isRefresh = false,
      this.isMovie = true,
      this.isBottomScroll = false});

  final int id;
  final int? page;
  final bool isBottomScroll;
  final bool isRefresh;
  final bool isMovie;

  @override
  List<Object> get props => [id];
}

class ArticleDisposeEvent extends ArticlePageEvent {
  const ArticleDisposeEvent();

  @override
  List<Object> get props => [];
}
