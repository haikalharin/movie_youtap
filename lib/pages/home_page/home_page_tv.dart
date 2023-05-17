import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../common/constants/string_constants.dart';
import '../../common/injector/injector.dart';
import '../../data/model/article_model/article_model.dart';
import '../../routes/route_name.dart';
import '../../utils/epragnancy_color.dart';
import '../list_article_page/bloc/article_bloc.dart';
import 'listCategoryMovie.dart';

class HomePageTv extends StatefulWidget {
  List<ArticleModel>? listArticle = [];
  String? condition = '';
  bool? isSearch = false;

  HomePageTv({this.listArticle, this.condition, this.isSearch = false});

  @override
  State<HomePageTv> createState() => _HomePageTv();
}

class _HomePageTv extends State<HomePageTv> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  Future<void> _handleRefresh() async {
    if (widget.isSearch == false) {
      Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent(
          page: 1, category: CategoryConstans.popular, isMovie: false));
      Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent(
          page: 1, category: CategoryConstans.airingToday, isMovie: false));
      Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent(
          page: 1, category: CategoryConstans.top_rated, isMovie: false));
      Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent(
          page: 1, category: CategoryConstans.onTheAir, isMovie: false));
    }
  }

  @override
  void initState() {
    if (widget.isSearch == false) {
      Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent(
          page: 1, category: CategoryConstans.popular, isMovie: false));
      Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent(
          page: 1, category: CategoryConstans.airingToday, isMovie: false));
      Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent(
          page: 1, category: CategoryConstans.top_rated, isMovie: false));
      Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent(
          page: 1, category: CategoryConstans.onTheAir, isMovie: false));
    }

    super.initState();
  }

  var articleBgColor = [];

  // final String nextMenu, content;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ArticlePageBloc, ArticlePageState>(
      listener: (context, state) {
        if (state.submitStatus == FormzStatus.submissionSuccess &&
            state.type == 'fetching-detail') {
          Navigator.of(context).pushNamed(RouteName.articleDetailPage,
              arguments: {
                "id": state.articleDetailModel?.id,
                "is_movie": false,
              }
             );
        }
      },
      child: BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Netplix Tv'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteName.listArticlePage,
                        arguments: {
                          "category_movie": CategoryConstans.search,
                          "is_search": true,
                          "is_movie": false
                        });
                  },
                ),
              ],
            ),
            body: Stack(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    decoration: BoxDecoration(color: Colors.white),
                    child: state.listArticlePopular == null
                        ? Stack(children: [
                            Container(
                                margin: EdgeInsets.only(), child: Container())
                          ])
                        : state.listArticlePopular!.isEmpty
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                    child: Text("Artikel tidak tersedia")))
                            : Stack(
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: Scrollbar(
                                          child: LiquidPullToRefresh(
                                              color: Colors.green,
                                              key: _refreshIndicatorKey,
                                              onRefresh: _handleRefresh,
                                              showChildOpacityTransition: false,
                                              child: ListView(
                                                children: [
                                                  ListCategoryMovie(
                                                    category: CategoryConstans
                                                        .popular,
                                                    listArticle: state
                                                        .listArticlePopular,
                                                    isMovie: false,
                                                  ),
                                                  ListCategoryMovie(
                                                    category: CategoryConstans
                                                        .airingToday,
                                                    listArticle: state
                                                        .listArticleAiringToday,
                                                    isMovie: false,
                                                  ),
                                                  ListCategoryMovie(
                                                    category: CategoryConstans
                                                        .onTheAir,
                                                    listArticle: state
                                                        .listArticleOnTheAir,
                                                    isMovie: false,
                                                  ),
                                                  ListCategoryMovie(
                                                    category: CategoryConstans
                                                        .top_rated,
                                                    listArticle: state
                                                        .listArticleTopRated,
                                                    isMovie: false,
                                                  ),
                                                  SizedBox(
                                                    height: 24,
                                                  )
                                                ],
                                              )),
                                        ),
                                      ),
                                      (state.submitStatus ==
                                                  FormzStatus
                                                      .submissionInProgress &&
                                              state.type ==
                                                  'get-next-page-article')
                                          ? _LoadingBottom()
                                          : Container()
                                    ],
                                  ),
                                ],
                              )),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LoadingBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.type == 'get-next-page-article') {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            color: Colors.white.withAlpha(90),
            child: Center(
                child: CircularProgressIndicator(
              color: EpregnancyColors.green,
            )));
      } else {
        return Text("");
      }
    });
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.type == 'fetching-article') {
        return Container(
            color: Colors.white.withAlpha(90),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return Text("");
      }
    });
  }
}
