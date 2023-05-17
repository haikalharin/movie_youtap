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
import '../../utils/epragnancy_color.dart';
import 'bloc/article_bloc.dart';

class ListArticleVertical extends StatefulWidget {
  List<ArticleModel>? listArticle = [];
  String? category = '';
  String? title = '';
  bool? isSearch = false;
  bool? isMovie = true;

  ListArticleVertical(
      {this.listArticle,
      this.category,
      this.title,
      this.isSearch = false,
      this.isMovie = false});

  @override
  State<ListArticleVertical> createState() => _ListArticleVerticalState();
}

class _ListArticleVerticalState extends State<ListArticleVertical> {
  final TextEditingController _searchTextController = TextEditingController();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();
  String _category = '';
  bool _isSearch = false;
  bool _isGetData = false;
  List<ArticleModel> _listMovie = [];

  Future<void> _handleRefresh() async {
    if (widget.isSearch == false) {
      Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent(
          page: 1,
          category: _category,
          isRefresh: true,
          isSearch: false,
          isMovie: widget.isMovie ?? true));
    }
  }

  @override
  void initState() {
    _category = widget.category ?? '';
    _isSearch = widget.isSearch ?? false;
    _isGetData = widget.isSearch == true ? false : true;
    _handleRefresh();

    super.initState();
  }

  @override
  void dispose() {
    // Injector.resolve<ArticlePageBloc>().add(ArticleDisposeEvent());
    super.dispose();
  }

  var articleBgColor = [];

  // final String nextMenu, content;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
      builder: (context, state) {
        if (_isGetData) {
          _listMovie = state.listArticle ?? [];
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              _category.contains('_')
                  ? _category.replaceAll('_', ' ')
                  : _category,
            ),
          ),
          body: Column(
            children: [
              _isSearch
                  ? Container(
                margin: EdgeInsets.all(16.w),
                height: 40.h,
                child: TextFormField(
                  controller: _searchTextController,
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (keyWord) {
                    setState(() {
                            _isGetData = true;
                          });

                          Injector.resolve<ArticlePageBloc>().add(
                              ArticleFetchEvent(
                                  page: 1,
                                  category: _category,
                                  keyword: _searchTextController.text,
                                  isSearch: true,
                                  isMovie: widget.isMovie ?? true));
                        },
                  decoration: InputDecoration(
                    prefixIconConstraints:
                    BoxConstraints(maxHeight: 35, maxWidth: 35),
                    prefixText: '',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    suffixIconConstraints:
                    BoxConstraints(maxWidth: 40, maxHeight: 21),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                                _isGetData = true;
                              });
                              _searchTextController.clear();
                              Injector.resolve<ArticlePageBloc>().add(
                                  ArticleFetchEvent(
                                      page: 1,
                                      category: _category,
                                      keyword: '',
                                      isMovie: widget.isMovie ?? true));
                              // Injector.resolve<PatientSelectBloc>().add(FetchPatientEvent(''));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                        top: 5.h, left: 20.w, right: 20.w),
                    hintText: "Cari Nama...",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: EpregnancyColors.primer,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: EpregnancyColors.borderGrey,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              )
                  : Container(),
              Flexible(
                flex: 6,
                child: Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        decoration: BoxDecoration(color: Colors.white),
                        child: _listMovie == null
                            ? Stack(children: [
                          Container(
                              margin: EdgeInsets.only(),
                              child: Container())
                        ])
                            : _listMovie.isEmpty
                            ? Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Center(
                                child:
                                Text("Artikel tidak tersedia")))
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
                                        if (widget.isSearch ==
                                            true) {
                                          Injector
                                                            .resolve<
                                                                ArticlePageBloc>()
                                                        .add(ArticleFetchEvent(
                                                            isBottomScroll:
                                                                true,
                                                            category: _category,
                                                            isSearch: true,
                                                            keyword:
                                                                _searchTextController
                                                                    .text,
                                                            isMovie: widget
                                                                    .isMovie ??
                                                                true));
                                                  } else {
                                          Injector.resolve<
                                                            ArticlePageBloc>()
                                                        .add(ArticleFetchEvent(
                                                            isBottomScroll:
                                                                true,
                                                            category: _category,
                                                            isMovie: widget
                                                                    .isMovie ??
                                                                true));
                                                  }
                                      }
                                    },
                                    child: Scrollbar(
                                      child: LiquidPullToRefresh(
                                          color: Colors.green,
                                          key: _refreshIndicatorKey,
                                          onRefresh: _handleRefresh,
                                          showChildOpacityTransition:
                                          false,
                                          child:
                                          _ListArticleBody()),
                                    ),
                                  ),
                                ),
                                (state.submitStatus ==
                                    FormzStatus
                                        .submissionInProgress &&
                                    state.type ==
                                        'get-next-page-article')
                                    ? _LoadingBottom()
                                    : Container(),
                                state.isLast?SizedBox(height: 20):Container()
                              ],
                            ),
                          ],
                        )),
                    _Loading(_category),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ListArticleBody extends StatelessWidget {
  _ListArticleBody({this.isMovie = true});
  bool? isMovie;



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
              state.listArticle![index].releaseDate != null &&
                  state.listArticle![index].releaseDate != '' ? state
                  .listArticle![index].releaseDate ?? "0000-00-00" : "0000-00-00"));
          // 12/3
          return InkWell(
            onTap: () {
              Injector.resolve<ArticlePageBloc>()
                  .add(
                  ArticleReadDetailEvent(state.listArticle![index].id ?? 0,isMovie: isMovie??true));
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
              margin: EdgeInsets.only(left: 10, right: 10,top: 20),
              child: Container(
                padding: EdgeInsets.only(
                    left: 12, top: 20, bottom: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: EpregnancyColors.primer.withAlpha(110)),
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Expanded(
                        child: Container(
                            width: 120.w,
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
  _Loading(this.category);
  String? category;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.type == 'fetching-article-$category') {
        return Container(
            color: Colors.white.withAlpha(90),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return Text("");
      }
    });
  }
}
