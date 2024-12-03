// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GalleryListResponseImpl _$$GalleryListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GalleryListResponseImpl(
      galleryWithDate: (json['galleryWithDate'] as List<dynamic>)
          .map((e) => GalleryWithDate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GalleryListResponseImplToJson(
        _$GalleryListResponseImpl instance) =>
    <String, dynamic>{
      'galleryWithDate': instance.galleryWithDate,
    };

_$GalleryWithDateImpl _$$GalleryWithDateImplFromJson(
        Map<String, dynamic> json) =>
    _$GalleryWithDateImpl(
      date: DateTime.parse(json['date'] as String),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$GalleryWithDateImplToJson(
        _$GalleryWithDateImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'images': instance.images,
    };
