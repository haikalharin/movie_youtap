import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../common/configurations/configurations.dart';
import '../../common/injector/injector.dart';
import '../../data/model/article_model/article_model.dart';
import '../../routes/route_name.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/article_bloc.dart';

class ListArticleVertical extends StatefulWidget {
  List<ArticleModel>? listArticle = [];
  String? category = '';
  String? title = '';
  bool? isSearch = false;

  ListArticleVertical(
      {this.listArticle, this.category,this.title, this.isSearch = false});

  @override
  State<ListArticleVertical> createState() => _ListArticleVerticalState();
}

class _ListArticleVerticalState extends State<ListArticleVertical> {
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
            appBar: AppBar(title: Text(widget.title??''),),
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
                                        child: LazyLoadScrollView(
                                          isLoading: state.submitStatus ==
                                                  FormzStatus
                                                      .submissionInProgress &&
                                              state.type ==
                                                  "get-next-page-article",
                                          onEndOfPage: () {
                                            if (!state.isLast) {
                                              if (widget.isSearch == true) {
                                                Injector.resolve<
                                                        ArticlePageBloc>()
                                                    .add(ArticleFetchEvent(
                                                        isBottomScroll: true));
                                              } else {
                                                Injector.resolve<
                                                        ArticlePageBloc>()
                                                    .add(ArticleFetchEvent(
                                                        isBottomScroll: true));
                                              }
                                            }
                                          },
                                          child: Scrollbar(
                                            child: LiquidPullToRefresh(
                                                color: EpregnancyColors.primer,
                                                key: _refreshIndicatorKey,
                                                onRefresh: _handleRefresh,
                                                showChildOpacityTransition:
                                                    false,
                                                child: _ListArticleBody()),
                                          ),
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

class _ListArticleBody extends StatelessWidget {
  _ListArticleBody();



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
          return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 16,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          String outputDate = "";
          var outputFormat = DateFormat.yMMMMd('id');
          outputDate = outputFormat.format(DateTime.parse(
              state.listArticle![index].releaseDate ?? "0000-00-00"));
          // 12/3
          return InkWell(
            onTap: () {
              Injector.resolve<ArticlePageBloc>()
                  .add(ArticleReadDetailEvent( state.listArticle![index].id ?? 0));
            },
            child: Container(
              height: 300,
              // padding: EdgeInsets.,
              decoration: BoxDecoration(
                image: state.listArticle != null &&
                        state.listArticle![index].posterPath != null
                    ? DecorationImage(
                        image: NetworkImage(
                            "${Configurations.imageUrl}${state.listArticle![index].posterPath!}"),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image:
                            new AssetImage('assets/images/userImage.png'),
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.bottomRight,
                      ),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black26,
              ),
              // color: Colors.greenAccent,
              margin: EdgeInsets.only(left: 20, right: 20,top: 20),
              child: Container(
                padding: EdgeInsets.only(
                    left: 20, top: 20, bottom: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: EpregnancyColors.primer.withAlpha(110)),
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Expanded(
                        child: Container(
                            width: 80.w,
                            margin: EdgeInsets.only(),
                            child: Text(
                              state.listArticle?[index].title ?? '',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                    child: Icon(
                                  Icons.access_time,
                                  color: Colors.white,
                                  size: 12,
                                )),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    child: Text(
                                      outputDate,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: EpregnancyColors.primer),
                            height: 18,
                            width: 100,
                            child: Center(
                                child: Text(
                              "Score: ${ state.listArticle?[index].voteAverage ?? ''}",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      )),
                    ])),
              ),
            ),
          );
        },
        itemCount: state.listArticle!.length,
      );
    });
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
