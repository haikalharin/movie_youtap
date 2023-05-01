import 'package:base_app_new/common/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../common/injector/injector.dart';
import '../../data/model/article_model/article_model.dart';
import '../../routes/route_name.dart';
import '../../utils/epragnancy_color.dart';
import '../list_article_page/bloc/article_bloc.dart';
import 'listCategoryMovie.dart';

class HomePage extends StatefulWidget {
  List<ArticleModel>? listArticle = [];
  String? condition = '';
  bool? isSearch = false;

  HomePage(
      {this.listArticle, this.condition, this.isSearch = false});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  Future<void> _handleRefresh() async {
    if (widget.isSearch == false) {
      Injector.resolve<ArticlePageBloc>()
          .add(ArticleFetchEvent(page: 1, category: CategoryConstans.popular));
      Injector.resolve<ArticlePageBloc>()
          .add(ArticleFetchEvent(page: 1, category: CategoryConstans.now_playing));
      Injector.resolve<ArticlePageBloc>()
          .add(ArticleFetchEvent(page: 1, category: CategoryConstans.top_rated));
      Injector.resolve<ArticlePageBloc>()
          .add(ArticleFetchEvent(page: 1, category: CategoryConstans.upcoming));
    }
  }

  @override
  void initState() {
    if (widget.isSearch == false) {
      Injector.resolve<ArticlePageBloc>()
          .add(ArticleFetchEvent(page: 1, category: CategoryConstans.popular));
      Injector.resolve<ArticlePageBloc>()
          .add(ArticleFetchEvent(page: 1, category: CategoryConstans.now_playing));
      Injector.resolve<ArticlePageBloc>()
          .add(ArticleFetchEvent(page: 1, category: CategoryConstans.top_rated));
      Injector.resolve<ArticlePageBloc>()
          .add(ArticleFetchEvent(page: 1, category: CategoryConstans.upcoming));
    }


    super.initState();
  }

  var articleBgColor = [
    ];

  // final String nextMenu, content;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ArticlePageBloc, ArticlePageState>(
      listener: (context, state) {
        if (state.submitStatus == FormzStatus.submissionSuccess &&
            state.type == 'fetching-detail') {
          Navigator.of(context).pushNamed(
              RouteName.articleDetailPage);
        }
      },
      child: BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Netplix'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteName.listArticlePage,
                        arguments: {
                          "category_movie": CategoryConstans.search,
                          "is_search": true
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
                                              showChildOpacityTransition:
                                                  false,
                                              child: ListView(
                                                children: [
                                                  ListCategoryMovie(
                                                    category: CategoryConstans
                                                        .popular,
                                                    listArticle: state
                                                        .listArticlePopular,
                                                  ),
                                                  ListCategoryMovie(
                                                    category: CategoryConstans
                                                        .now_playing,
                                                    listArticle: state
                                                        .listArticleNowPlaying,
                                                  ),
                                                  ListCategoryMovie(
                                                    category: CategoryConstans
                                                        .upcoming,
                                                    listArticle: state
                                                        .listArticleUpcoming,
                                                  ),
                                                  ListCategoryMovie(
                                                    category: CategoryConstans
                                                        .top_rated,
                                                    listArticle: state
                                                        .listArticleTopRated,
                                                  ),
                                                  SizedBox(height: 24,)
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
