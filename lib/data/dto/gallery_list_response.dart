// To parse this JSON data, do
//
//     final galleryListResponse = galleryListResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_list_response.freezed.dart';
part 'gallery_list_response.g.dart';

List<GalleryItemResponse> deserializeGalleryItemResponseList(
        List<Map<String, dynamic>> json) =>
    json.map((e) => GalleryItemResponse.fromJson(e)).toList();

List<Map<String, dynamic>> serializeGalleryItemResponseList(
        List<GalleryItemResponse> objects) =>
    objects.map((e) => e.toJson()).toList();

@freezed
class GalleryItemResponse with _$GalleryItemResponse {
  const factory GalleryItemResponse({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "photos") required List<Photo> photos,
    @JsonKey(name: "portrait") required bool portrait,
    @JsonKey(name: "likes") required Map<String, LikeDetail> likes,
    @JsonKey(name: "createdAt") required DateTime createdAt,
  }) = _GalleryItemResponse;

  factory GalleryItemResponse.fromJson(Map<String, dynamic> json) =>
      _$GalleryItemResponseFromJson(json);
}

@freezed
class Photo with _$Photo {
  const factory Photo({
    @JsonKey(name: "url") required String url,
    @JsonKey(name: "resolution") required Resolution resolution,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@freezed
class Resolution with _$Resolution {
  const factory Resolution({
    @JsonKey(name: "quality") required int quality,
    @JsonKey(name: "zoom") bool? zoom,
    @JsonKey(name: "format") required String format,
    @JsonKey(name: "width") int? width,
    @JsonKey(name: "height") int? height,
  }) = _Resolution;

  factory Resolution.fromJson(Map<String, dynamic> json) =>
      _$ResolutionFromJson(json);
}

@freezed
class LikeDetail with _$LikeDetail {
  const factory LikeDetail({
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "likedAt") required DateTime likedAt,
  }) = _LikeDetail;

  factory LikeDetail.fromJson(Map<String, dynamic> json) =>
      _$LikeDetailFromJson(json);
}
