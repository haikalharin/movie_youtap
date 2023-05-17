import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/constants/string_constants.dart';
import '../../../common/exceptions/article_error_exception.dart';
import '../../../data/model/article_detail_model/article_detail_model.dart';
import '../../../data/model/article_model/article_model.dart';
import '../../../data/model/response_model/response_model.dart';
import '../../../data/model/watch_video_model/watch_video_model.dart';
import '../../../data/repository/article_repository/article_repository.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticlePageBloc extends Bloc<ArticlePageEvent, ArticlePageState> {
  ArticlePageBloc(this.articleRepository) : super(ArticlePageInitial());

  final ArticleRepository articleRepository;

  @override
  Stream<ArticlePageState> mapEventToState(ArticlePageEvent event) async* {
    if (event is ArticleFetchEvent) {
      yield* _mapArticleFetchEventToState(event, state);
    } else if (event is ArticleReadDetailEvent) {
      yield* _mapArticleReadDetailEventToState(event, state);
    } else if (event is ArticleVideoDetailEvent) {
      yield* _mapArticleVideoDetailEventToState(event, state);
    } else if (event is ReadRecommendationsMovieArticle) {
      yield* _mapReadRecommendationsMovieArticleToState(event, state);
    } else if (event is ArticleDisposeEvent) {
      yield _mapArticleDisposeEventToState(event, state);
    }
  }

  ArticlePageState _mapArticleDisposeEventToState(
    ArticleDisposeEvent event,
    ArticlePageState state,
  ) {
    return ArticlePageState(
      submitStatus: state.submitStatus,
        type: state.type,
        listArticlePopular: state.listArticlePopular,
        listArticleNowPlaying: state.listArticleNowPlaying,
        listArticleUpcoming: state.listArticleUpcoming,
    listArticleTopRated: state.listArticleTopRated,
    listArticleRecommendations: state.listArticleRecommendations,
        articleDetailModel: state.articleDetailModel,
        listWatchVideo: state.listWatchVideo,
        idMovie: state.idMovie);
  }

  Stream<ArticlePageState> _mapArticleFetchEventToState(
    ArticleFetchEvent event,
    ArticlePageState state,
  ) async* {
    if (event.isBottomScroll) {
      yield state.copyWith(
          submitStatus: FormzStatus.submissionInProgress,
          type: 'get-next-page-article');
    }else {
      yield state.copyWith(
          submitStatus: FormzStatus.submissionInProgress,
          type: 'fetching-article-${event.category}');
    }
    try {
      int? page = state.page;
      DateTime dateEnd = DateTime.now();
      DateTime dateStart = dateEnd.subtract(Duration(days: 365));
      bool isLast = false;
      String endString = DateFormat('yyyy-MM-dd').format(dateEnd);
      String startString = DateFormat('yyyy-MM-dd').format(dateStart);

      if (event.page != 0) {
        page = event.page ?? 1;
      }
      ResponseModel response = ResponseModel.resultsEmpty();
      if(event.isMovie) {
        response = await articleRepository.fetchArticle(
            page, startString, endString, event.category ?? '',
            event.keyword ?? '', event.isSearch ?? false);
      } else {
        response = await articleRepository.fetchArticleTv(
            page, startString, endString, event.category ?? '',
            event.keyword ?? '', event.isSearch ?? false);
      }
      List<ArticleModel> data = [];
      String next = '';

      if (response.results != null) {
        if (state.listArticle != null && event.page != 1) {
          data = state.listArticle ?? [];
          data.addAll(response.results);
        } else {
          data = response.results;
        }
        next = response.next ?? '';
        if (response.totalPage! > page) {
          if(event.isRefresh){
            page = event.page!+1;
          } else {
            page = state.page + 1;
          }
        } else {
          isLast = true;
        }
      }
      if (event.category == CategoryConstans.popular) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listArticlePopular: data,
            listArticle: data,
            page: page,
            isLast: isLast,
            next: next,
            type: 'fetching-article');
      } else if (event.category == CategoryConstans.now_playing) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listArticleNowPlaying: data,
            listArticle: data,
            page: page,
            isLast: isLast,
            next: next,
            type: 'fetching-article');
      } else if (event.category == CategoryConstans.upcoming) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listArticleUpcoming: data,
            listArticle: data,
            page: page,
            isLast: isLast,
            next: next,
            type: 'fetching-article');
      } else if (event.category == CategoryConstans.airingToday) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listArticleAiringToday: data,
            listArticle: data,
            page: page,
            isLast: isLast,
            next: next,
            type: 'fetching-article');
      } else if (event.category == CategoryConstans.onTheAir) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listArticleOnTheAir: data,
            listArticle: data,
            page: page,
            isLast: isLast,
            next: next,
            type: 'fetching-article');
      }  else if (event.category == CategoryConstans.top_rated) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listArticleTopRated: data,
            listArticle: data,
            page: page,
            isLast: isLast,
            next: next,
            type: 'fetching-article');
      } else if (event.category == CategoryConstans.recommendations) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listArticleRecommendations: data,
            listArticle: data,
            page: page,
            isLast: isLast,
            next: next,
            type: 'fetching-article');
      } else if (event.category == CategoryConstans.search) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listArticle: data,
            page: page,
            isLast: isLast,
            next: next,
            type: 'fetching-article');
      } else {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listArticle: data,
            page: page,
            isLast: isLast,
            next: next,
            type: 'fetching-article');
      }
    } on ArticleErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {}
  }

  Stream<ArticlePageState> _mapArticleReadDetailEventToState(
    ArticleReadDetailEvent event,
    ArticlePageState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress,
        type: 'fetching-detail');
    try {
      ArticleDetailModel response = ArticleDetailModel();
      if(event.isMovie) {
        response = await articleRepository.readDetailArticle(event.id);
      }else{
        response = await articleRepository.readDetailArticleTv(event.id);

      }
      if (response.id != null) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            articleDetailModel: response,
          type: 'fetching-detail',);
      }

    } on ArticleErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {}
  }

  Stream<ArticlePageState> _mapArticleVideoDetailEventToState(
      ArticleVideoDetailEvent event,
      ArticlePageState state,
      ) async* {
    // yield state.copyWith(
    //     submitStatus: FormzStatus.submissionInProgress,
    //     type: 'fetching-video');
    try {

      ResponseModel response = ResponseModel.resultsEmpty();
      if(event.isMovie) {
        response = await articleRepository.readDetailVideoArticle(event.id);
      } else{
        response = await articleRepository.readDetailVideoArticleTv(event.id);

      }
      if (response.results != null && response.results != []) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listWatchVideo: response.results,
            idMovie: response.id??0,
            type: 'fetching-video');
      } else {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure,
            type: 'fetching-video');
      }
    } on ArticleErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {}
  }

//
  Stream<ArticlePageState> _mapReadRecommendationsMovieArticleToState(
    ReadRecommendationsMovieArticle event,
    ArticlePageState state,
  ) async* {
    if (event.isBottomScroll) {
      yield state.copyWith(
          submitStatus: FormzStatus.submissionInProgress,
          type: 'get-next-page-article');
    }

    try {
      List<ArticleModel> data = [];
      bool isLast = false;
      int? page = state.page;
      if (event.page != 0) {
        page = event.page ?? 1;
      }
      ResponseModel response = ResponseModel.resultsEmpty();
      if(event.isMovie) {
        response = await articleRepository
            .readRecommendationsMovieArticle(event.id, page);
      } else{
        response = await articleRepository
            .readRecommendationsMovieArticleTv(event.id, page);
      }

      if (response.results != null) {
        if (state.listArticle != null && event.page != 1) {
          data = state.listArticle ?? [];
          data.addAll(response.results);
        } else {
          data = response.results;
        }
        if (response.totalPage! > page ) {
          if(event.isRefresh){
            page = event.page!+1;
          } else {
            page = state.page + 1;
          }
        } else {
          isLast = true;
        }
      }
      if (response.results != null && response.results != []) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listArticleRecommendations: data,
            listArticle: data,
            idMovie: response.id ?? 0,
            page: page,
            isLast: isLast,
            type: 'fetching-article');
      } else {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure,
            type: 'fetching-article');
      }
    } on ArticleErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {}
  }
//

}
