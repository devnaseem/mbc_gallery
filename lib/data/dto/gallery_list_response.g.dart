// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GalleryListResponseImpl _$$GalleryListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GalleryListResponseImpl(
      gallery: (json['gallery'] as List<dynamic>)
          .map((e) => Gallery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GalleryListResponseImplToJson(
        _$GalleryListResponseImpl instance) =>
    <String, dynamic>{
      'gallery': instance.gallery,
    };

_$GalleryImpl _$$GalleryImplFromJson(Map<String, dynamic> json) =>
    _$GalleryImpl(
      image: json['image'] as String,
    );

Map<String, dynamic> _$$GalleryImplToJson(_$GalleryImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
    };
