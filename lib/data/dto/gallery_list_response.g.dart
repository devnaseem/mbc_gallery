// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GalleryItemResponseImpl _$$GalleryItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GalleryItemResponseImpl(
      id: json['id'] as String,
      photos: (json['photos'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      portrait: json['portrait'] as bool,
      likes: (json['likes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, LikeDetail.fromJson(e as Map<String, dynamic>)),
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      visitId: json['visitId'] as String,
    );

Map<String, dynamic> _$$GalleryItemResponseImplToJson(
        _$GalleryItemResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photos': instance.photos,
      'portrait': instance.portrait,
      'likes': instance.likes,
      'createdAt': instance.createdAt.toIso8601String(),
      'visitId': instance.visitId,
    };

_$PhotoImpl _$$PhotoImplFromJson(Map<String, dynamic> json) => _$PhotoImpl(
      url: json['url'] as String,
      resolution:
          Resolution.fromJson(json['resolution'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PhotoImplToJson(_$PhotoImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'resolution': instance.resolution,
    };

_$ResolutionImpl _$$ResolutionImplFromJson(Map<String, dynamic> json) =>
    _$ResolutionImpl(
      quality: (json['quality'] as num).toInt(),
      zoom: json['zoom'] as bool?,
      format: json['format'] as String,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ResolutionImplToJson(_$ResolutionImpl instance) =>
    <String, dynamic>{
      'quality': instance.quality,
      'zoom': instance.zoom,
      'format': instance.format,
      'width': instance.width,
      'height': instance.height,
    };

_$LikeDetailImpl _$$LikeDetailImplFromJson(Map<String, dynamic> json) =>
    _$LikeDetailImpl(
      name: json['name'] as String,
      likedAt: DateTime.parse(json['likedAt'] as String),
    );

Map<String, dynamic> _$$LikeDetailImplToJson(_$LikeDetailImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'likedAt': instance.likedAt.toIso8601String(),
    };
