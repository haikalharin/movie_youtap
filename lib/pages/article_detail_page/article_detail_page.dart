import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../common/configurations/configurations.dart';
import '../../common/injector/injector.dart';
import '../../routes/route_name.dart';
import '../../utils/epragnancy_color.dart';
import '../list_article_page/bloc/article_bloc.dart';

class ArticleDetailPage extends StatefulWidget {
  ArticleDetailPage();

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {

  var articleBgColor = [
    EpregnancyColors.coolGreen,
    EpregnancyColors.periwinkle,
    EpregnancyColors.rosePink
  ];
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<ArticlePageBloc, ArticlePageState>(
          listener: (context, state) {
            if (state.submitStatus == FormzStatus.submissionSuccess &&
                state.type == 'fetching-video') {
              Navigator.of(context).pushNamed(
                  RouteName.watchVideoPreview,
                  arguments: {"movie": state.listWatchVideo});
            }
          },
          child: BlocBuilder<ArticlePageBloc, ArticlePageState>(
            builder: (context, state) {
              String outputDate = "";
              var outputFormat = DateFormat.yMMMMd('id');
              outputDate = outputFormat.format(DateTime.parse(
                  state.articleDetailModel?.releaseDate ?? "0000-00-00"));

              return Stack(
                children: [
                  NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            expandedHeight: 300.0,
                            floating: false,
                            pinned: true,
                            elevation: 0.0,
                            leading: GestureDetector(
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.grey,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            backgroundColor: Colors.white,
                            flexibleSpace: FlexibleSpaceBar(
                              centerTitle: false,
                              title: Container(),
                              background: InkWell(
                                onTap: () {
                                  Injector.resolve<ArticlePageBloc>().add(
                                      ArticleVideoDetailEvent(
                                          state.articleDetailModel?.id ?? 0));
                                },
                                child: Image(
                                  image: NetworkImage(state.articleDetailModel
                                              ?.backdropPath !=
                                          null
                                      ? "${Configurations.imageUrl}${state.articleDetailModel?.posterPath!}"
                                      : 'https://images.nintendolife.com/7eb5b6e59be08/a-hat-in-time-cover.cover_large.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        header(context, state,outputDate)
                      ];
                    },
                    body: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: Html(
                                      data:
                                          state.articleDetailModel?.overview ??
                                              '',
                                      style: {
                                        "body": Style(
                                            fontSize: FontSize(16.0),
                                            color: Colors.black),
                                      })),
                            ),
                          ),
                        ],
                      )),
                  _Loading()
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context, ArticlePageState state,String outputDate) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: EpregnancyColors.green),
                      height: 30,
                      width: 100,
                      child: Center(
                          child: Text(
                            "Rating : ${state.articleDetailModel?.voteAverage.toString() ?? '0.0'}",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    Icon(Icons.ios_share),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  state.articleDetailModel?.title ?? '',
                  maxLines: 5,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.clip,
                ),
              ),
              Expanded(
                child: Container(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state
                            .articleDetailModel?.productionCompanies?.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5, right: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: articleBgColor[Random().nextInt(3)]),
                                height: 30,
                                width: 180,
                                child: Center(
                                    child: Text(
                                  state.articleDetailModel
                                              ?.productionCompanies !=
                                          null
                                      ? state
                                              .articleDetailModel
                                              ?.productionCompanies![index]
                                              .name ??
                                          ''
                                      : '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          );
                        })),
              ),
              Expanded(
                child: Container(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.articleDetailModel?.genres?.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5, right: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: EpregnancyColors.orange),
                                height: 20,
                                width: 100,
                                child: Center(
                                    child: Text(
                                  state.articleDetailModel?.genres != null
                                      ? state.articleDetailModel?.genres![index]
                                              .name ??
                                          ''
                                      : '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          );
                        })),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                            child: Icon(
                          Icons.access_time,
                          size: 18,
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            child: Text(
                          outputDate,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )),
                      ],
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._widget);

  final Widget _widget;

  @override
  double get minExtent => 120.h;

  @override
  double get maxExtent => 180.h;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _widget,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.type == 'fetching-detail') {
        return Container(
            color: Colors.white.withAlpha(90),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return Text("");
      }
    });
  }
}
