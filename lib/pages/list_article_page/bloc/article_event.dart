part of 'article_bloc.dart';

@immutable
abstract class ArticlePageEvent extends Equatable {
  const ArticlePageEvent();

  @override
  List<Object> get props => [];
}

enum SortEnum { asc, desc }

class ArticleFetchEvent extends ArticlePageEvent {
  const ArticleFetchEvent({this.page = 0,this.isBottomScroll=false});

  final int? page;
  final bool isBottomScroll;

  @override
  List<Object> get props => [];
}

class ArticleReadDetailEvent extends ArticlePageEvent {
  const ArticleReadDetailEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}

class ArticleBackEvent extends ArticlePageEvent {
  const ArticleBackEvent();

  @override
  List<Object> get props => [];
}
