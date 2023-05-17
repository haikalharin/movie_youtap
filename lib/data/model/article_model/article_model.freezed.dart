// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'article_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) {
  return _ArticleModel.fromJson(json);
}

/// @nodoc
class _$ArticleModelTearOff {
  const _$ArticleModelTearOff();

  _ArticleModel call(
      {bool? adult,
      String? backdropPath,
      List<int>? genreIds,
      int? id,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      double? popularity,
      String? posterPath,
      String? releaseDate,
      String? title,
      String? name,
      bool? video,
      double? voteAverage,
      int? voteCount}) {
    return _ArticleModel(
      adult: adult,
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      name: name,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  ArticleModel fromJson(Map<String, Object?> json) {
    return ArticleModel.fromJson(json);
  }
}

/// @nodoc
const $ArticleModel = _$ArticleModelTearOff();

/// @nodoc
mixin _$ArticleModel {
  bool? get adult => throw _privateConstructorUsedError;
  String? get backdropPath => throw _privateConstructorUsedError;
  List<int>? get genreIds => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get originalLanguage => throw _privateConstructorUsedError;
  String? get originalTitle => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  double? get popularity => throw _privateConstructorUsedError;
  String? get posterPath => throw _privateConstructorUsedError;
  String? get releaseDate => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get video => throw _privateConstructorUsedError;
  double? get voteAverage => throw _privateConstructorUsedError;
  int? get voteCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleModelCopyWith<ArticleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleModelCopyWith<$Res> {
  factory $ArticleModelCopyWith(
          ArticleModel value, $Res Function(ArticleModel) then) =
      _$ArticleModelCopyWithImpl<$Res>;
  $Res call(
      {bool? adult,
      String? backdropPath,
      List<int>? genreIds,
      int? id,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      double? popularity,
      String? posterPath,
      String? releaseDate,
      String? title,
      String? name,
      bool? video,
      double? voteAverage,
      int? voteCount});
}

/// @nodoc
class _$ArticleModelCopyWithImpl<$Res> implements $ArticleModelCopyWith<$Res> {
  _$ArticleModelCopyWithImpl(this._value, this._then);

  final ArticleModel _value;
  // ignore: unused_field
  final $Res Function(ArticleModel) _then;

  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? id = freezed,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? title = freezed,
    Object? name = freezed,
    Object? video = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
  }) {
    return _then(_value.copyWith(
      adult: adult == freezed
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: genreIds == freezed
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      originalLanguage: originalLanguage == freezed
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: originalTitle == freezed
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: popularity == freezed
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool?,
      voteAverage: voteAverage == freezed
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: voteCount == freezed
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ArticleModelCopyWith<$Res>
    implements $ArticleModelCopyWith<$Res> {
  factory _$ArticleModelCopyWith(
          _ArticleModel value, $Res Function(_ArticleModel) then) =
      __$ArticleModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? adult,
      String? backdropPath,
      List<int>? genreIds,
      int? id,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      double? popularity,
      String? posterPath,
      String? releaseDate,
      String? title,
      String? name,
      bool? video,
      double? voteAverage,
      int? voteCount});
}

/// @nodoc
class __$ArticleModelCopyWithImpl<$Res> extends _$ArticleModelCopyWithImpl<$Res>
    implements _$ArticleModelCopyWith<$Res> {
  __$ArticleModelCopyWithImpl(
      _ArticleModel _value, $Res Function(_ArticleModel) _then)
      : super(_value, (v) => _then(v as _ArticleModel));

  @override
  _ArticleModel get _value => super._value as _ArticleModel;

  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? genreIds = freezed,
    Object? id = freezed,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? releaseDate = freezed,
    Object? title = freezed,
    Object? name = freezed,
    Object? video = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
  }) {
    return _then(_ArticleModel(
      adult: adult == freezed
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: genreIds == freezed
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      originalLanguage: originalLanguage == freezed
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: originalTitle == freezed
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: popularity == freezed
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool?,
      voteAverage: voteAverage == freezed
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: voteCount == freezed
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    fieldRename: FieldRename.snake, includeIfNull: true, explicitToJson: true)
class _$_ArticleModel implements _ArticleModel {
  const _$_ArticleModel(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.name,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory _$_ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$$_ArticleModelFromJson(json);

  @override
  final bool? adult;
  @override
  final String? backdropPath;
  @override
  final List<int>? genreIds;
  @override
  final int? id;
  @override
  final String? originalLanguage;
  @override
  final String? originalTitle;
  @override
  final String? overview;
  @override
  final double? popularity;
  @override
  final String? posterPath;
  @override
  final String? releaseDate;
  @override
  final String? title;
  @override
  final String? name;
  @override
  final bool? video;
  @override
  final double? voteAverage;
  @override
  final int? voteCount;

  @override
  String toString() {
    return 'ArticleModel(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, name: $name, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ArticleModel &&
            const DeepCollectionEquality().equals(other.adult, adult) &&
            const DeepCollectionEquality()
                .equals(other.backdropPath, backdropPath) &&
            const DeepCollectionEquality().equals(other.genreIds, genreIds) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.originalLanguage, originalLanguage) &&
            const DeepCollectionEquality()
                .equals(other.originalTitle, originalTitle) &&
            const DeepCollectionEquality().equals(other.overview, overview) &&
            const DeepCollectionEquality()
                .equals(other.popularity, popularity) &&
            const DeepCollectionEquality()
                .equals(other.posterPath, posterPath) &&
            const DeepCollectionEquality()
                .equals(other.releaseDate, releaseDate) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.video, video) &&
            const DeepCollectionEquality()
                .equals(other.voteAverage, voteAverage) &&
            const DeepCollectionEquality().equals(other.voteCount, voteCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(adult),
      const DeepCollectionEquality().hash(backdropPath),
      const DeepCollectionEquality().hash(genreIds),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(originalLanguage),
      const DeepCollectionEquality().hash(originalTitle),
      const DeepCollectionEquality().hash(overview),
      const DeepCollectionEquality().hash(popularity),
      const DeepCollectionEquality().hash(posterPath),
      const DeepCollectionEquality().hash(releaseDate),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(video),
      const DeepCollectionEquality().hash(voteAverage),
      const DeepCollectionEquality().hash(voteCount));

  @JsonKey(ignore: true)
  @override
  _$ArticleModelCopyWith<_ArticleModel> get copyWith =>
      __$ArticleModelCopyWithImpl<_ArticleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticleModelToJson(this);
  }
}

abstract class _ArticleModel implements ArticleModel {
  const factory _ArticleModel(
      {bool? adult,
      String? backdropPath,
      List<int>? genreIds,
      int? id,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      double? popularity,
      String? posterPath,
      String? releaseDate,
      String? title,
      String? name,
      bool? video,
      double? voteAverage,
      int? voteCount}) = _$_ArticleModel;

  factory _ArticleModel.fromJson(Map<String, dynamic> json) =
      _$_ArticleModel.fromJson;

  @override
  bool? get adult;
  @override
  String? get backdropPath;
  @override
  List<int>? get genreIds;
  @override
  int? get id;
  @override
  String? get originalLanguage;
  @override
  String? get originalTitle;
  @override
  String? get overview;
  @override
  double? get popularity;
  @override
  String? get posterPath;
  @override
  String? get releaseDate;
  @override
  String? get title;
  @override
  String? get name;
  @override
  bool? get video;
  @override
  double? get voteAverage;
  @override
  int? get voteCount;
  @override
  @JsonKey(ignore: true)
  _$ArticleModelCopyWith<_ArticleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
