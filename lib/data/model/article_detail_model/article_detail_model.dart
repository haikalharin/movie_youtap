// To parse this JSON data, do
//
//     final articleDetailModel = articleDetailModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'article_detail_model.freezed.dart';
part 'article_detail_model.g.dart';

ArticleDetailModel articleDetailModelFromJson(String str) => ArticleDetailModel.fromJson(json.decode(str));

String articleDetailModelToJson(ArticleDetailModel data) => json.encode(data.toJson());

@freezed
class ArticleDetailModel with _$ArticleDetailModel {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory ArticleDetailModel({
    bool? adult,
    String? backdropPath,
    BelongsToCollection? belongsToCollection,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompany>? productionCompanies,
    List<ProductionCountry>? productionCountries,
    String? releaseDate,
    int? revenue,
    int? runtime,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) = _ArticleDetailModel;

  factory ArticleDetailModel.fromJson(Map<String, dynamic> json) => _$ArticleDetailModelFromJson(json);
}

@freezed
class BelongsToCollection with _$BelongsToCollection {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory BelongsToCollection({
    int? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) = _BelongsToCollection;

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) => _$BelongsToCollectionFromJson(json);
}

@freezed
class Genre with _$Genre {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory Genre({
    int? id,
    String? name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class ProductionCompany with _$ProductionCompany {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory ProductionCompany({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);
}

@freezed
class ProductionCountry with _$ProductionCountry {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory ProductionCountry({
    String? iso31661,
    String? name,
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => _$ProductionCountryFromJson(json);
}

@freezed
class SpokenLanguage with _$SpokenLanguage {
  @JsonSerializable(fieldRename: FieldRename.snake,includeIfNull: true, explicitToJson: true)
  const factory SpokenLanguage({
    String? englishName,
    String? iso6391,
    String? name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);
}
