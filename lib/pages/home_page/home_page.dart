import 'package:base_app_new/pages/home_page/list_article_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../common/injector/injector.dart';
import '../../data/model/article_model/article_model.dart';
import '../../routes/route_name.dart';
import '../../utils/epragnancy_color.dart';
import '../list_article_page/bloc/article_bloc.dart';
import 'list_shimmer.dart';

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
      Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent(page: 1));
    }
  }

  @override
  void initState() {
    if (widget.isSearch == false) {
      Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent(page: 1));
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
            appBar: AppBar(title: Text('Playstation 5 Games'),),
            body: Stack(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    decoration: BoxDecoration(color: Colors.white),
                    child: state.listArticle == null
                        ? Stack(children: [
                            Container(
                                margin: EdgeInsets.only(), child: Container())
                          ])
                        : state.listArticle!.isEmpty
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
                                              color: EpregnancyColors.primer,
                                              key: _refreshIndicatorKey,
                                              onRefresh: _handleRefresh,
                                              showChildOpacityTransition:
                                                  false,
                                              child: Column(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.only(
                                                            left: 20, right: 20, bottom: 8),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                                child: const Text(
                                                                  "Artikel Untuk Anda",
                                                                  style: TextStyle(
                                                                      fontSize: 16,
                                                                      fontWeight: FontWeight.w700),
                                                                )),
                                                            InkWell(
                                                              onTap: () {

                                                                Navigator.of(context).pushNamed(
                                                                    RouteName.articleDetailPage);
                                                              },
                                                              child: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                        margin:
                                                                        EdgeInsets.only(right: 5),
                                                                        child: Text(
                                                                          "Artikel lainnya",
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              fontWeight:
                                                                              FontWeight.w500,
                                                                              color: Colors.grey),
                                                                        )),
                                                                    Container(
                                                                      child: const Icon(
                                                                        Icons.arrow_forward_ios,
                                                                        size: 20,
                                                                        color: Colors.grey,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          state.submitStatus ==
                                                              FormzStatus
                                                                  .submissionInProgress &&
                                                              state.type == 'listArticle'
                                                              ? Expanded(child: ListShimmer())
                                                              : Expanded(
                                                              child: ListArticleHorizontal(
                                                                listArticle:
                                                                state.listArticle ?? [],
                                                              ))
                                                        ],
                                                      ),
                                                    ],
                                                  ),
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
                _Loading(),
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
