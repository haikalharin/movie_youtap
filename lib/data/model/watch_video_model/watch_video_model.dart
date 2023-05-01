// To parse this JSON data, do
//
//     final watchVideoModel = watchVideoModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'watch_video_model.freezed.dart';
part 'watch_video_model.g.dart';

WatchVideoModel watchVideoModelFromJson(String str) => WatchVideoModel.fromJson(json.decode(str));

String watchVideoModelToJson(WatchVideoModel data) => json.encode(data.toJson());

@freezed
class WatchVideoModel with _$WatchVideoModel {
  const factory WatchVideoModel({
    String? iso6391,
    String? iso31661,
    String? name,
    String? key,
    String? site,
    int? size,
    String? type,
    bool? official,
    String? publishedAt,
    String? id,
  }) = _WatchVideoModel;

  factory WatchVideoModel.fromJson(Map<String, dynamic> json) => _$WatchVideoModelFromJson(json);
}
