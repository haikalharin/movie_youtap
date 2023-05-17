import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../common/constants/string_constants.dart';
import '../../data/model/article_model/article_model.dart';
import '../../routes/route_name.dart';
import '../list_article_page/bloc/article_bloc.dart';
import 'list_article_horizontal.dart';
import 'list_shimmer.dart';

class ListCategoryMovie extends StatelessWidget {
  const ListCategoryMovie({Key? key, this.category,this.isMovie = true, this.listArticle})
      : super(key: key);
  final String? category;
  final bool? isMovie;
  final List<ArticleModel>? listArticle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Text(
                    category!.contains('_')
                        ? category!.replaceAll('_', ' ')
                        : category ?? '',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  )),
                  InkWell(
                    onTap: () {
                      if(category == CategoryConstans.recommendations){
                        Navigator.of(context).pushNamed(
                            RouteName.listArticleRecommendPage,
                            arguments: {
                              "movie": state.articleDetailModel,
                              "category_movie": category,
                              "is_search": false,
                              "is_movie": isMovie,
                            });
                      }else {
                        Navigator.of(context).pushNamed(
                            RouteName.listArticlePage,
                            arguments: {
                              "category_movie": category,
                              "is_search": false,
                              "is_movie": isMovie,
                            });
                      }
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Text(
                                "More",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
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
                state.submitStatus == FormzStatus.submissionInProgress &&
                        state.type == 'fetching-article-$category'
                    ? Expanded(child: ListShimmer())
                    : Expanded(
                        child: ListArticleHorizontal(
                        listArticle: listArticle ?? [],isMovie: isMovie,
                      ))
              ],
            ),
          ],
        );
      },
    );
  }
}
