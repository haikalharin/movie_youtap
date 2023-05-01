// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WatchVideoModel _$$_WatchVideoModelFromJson(Map<String, dynamic> json) =>
    _$_WatchVideoModel(
      iso6391: json['iso6391'] as String?,
      iso31661: json['iso31661'] as String?,
      name: json['name'] as String?,
      key: json['key'] as String?,
      site: json['site'] as String?,
      size: json['size'] as int?,
      type: json['type'] as String?,
      official: json['official'] as bool?,
      publishedAt: json['publishedAt'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_WatchVideoModelToJson(_$_WatchVideoModel instance) =>
    <String, dynamic>{
      'iso6391': instance.iso6391,
      'iso31661': instance.iso31661,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'publishedAt': instance.publishedAt,
      'id': instance.id,
    };
