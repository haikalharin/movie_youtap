
import 'package:base_app_new/data/model/article_model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/epragnancy_color.dart';

class ListShimmer extends StatelessWidget {


  List<ArticleModel> listPrivilegesData = [
    ArticleModel(
        title: "",
        originalTitle: ""),
   ArticleModel(
        title: "",
        originalTitle: ""),
   ArticleModel(
        title: "",
        originalTitle: ""),
   ArticleModel(
        title: "",
        originalTitle: ""),
   ArticleModel(
        title: "",
        originalTitle: ""),
   ArticleModel(
        title: "",
        originalTitle: ""),
   ArticleModel(
        title: "",
        originalTitle: ""),
   ArticleModel(
        title: "",
        originalTitle: ""),


  ];

  // final String nextMenu, content;

  // ListPrivilegesWidget(this.content,{this.listPrivilegesData,this.nextMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 125,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(color: Colors.white),
        child: listPrivilegesData.isEmpty
            ? Stack(children: [
          Container(margin: EdgeInsets.only(), child: Container())
        ])
            : Stack(
          children: [
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                  // 12/3
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.white,
                  child: Container(
                    // padding: EdgeInsets.,
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(10.0),
                        color: EpregnancyColors.primer),
                    // color: Colors.greenAccent,
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 200,
                                      margin: EdgeInsets.only(),
                                      child: Text("sadas")),
                                  Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                              child: Icon(
                                                Icons.access_time,
                                                size: 12,
                                              )),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                              child: Text(
                                                "asdsa",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              )),
                                        ],
                                      )),
                                ])),
                      ],
                    ),
                  ),
                );
              },
              itemCount: listPrivilegesData.length,
            ),
          ],
        ));
  }
}
