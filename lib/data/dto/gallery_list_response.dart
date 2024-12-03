// To parse this JSON data, do
//
//     final galleryListResponse = galleryListResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_list_response.freezed.dart';
part 'gallery_list_response.g.dart';

GalleryListResponse deserializeGalleryListResponse(Map<String, dynamic> json) =>
    GalleryListResponse.fromJson(json);

Map<String, dynamic> serializeGalleryListResponse(
    GalleryListResponse galleryListResponse,
    ) =>
    galleryListResponse.toJson();

@freezed
class GalleryListResponse with _$GalleryListResponse {
  const factory GalleryListResponse({
    @JsonKey(name: "galleryWithDate")
    required List<GalleryWithDate> galleryWithDate,
  }) = _GalleryListResponse;

  factory GalleryListResponse.fromJson(Map<String, dynamic> json) => _$GalleryListResponseFromJson(json);
}

@freezed
class GalleryWithDate with _$GalleryWithDate {
  const factory GalleryWithDate({
    @JsonKey(name: "date")
    required DateTime date,
    @JsonKey(name: "images")
    required List<String> images,
  }) = _GalleryWithDate;

  factory GalleryWithDate.fromJson(Map<String, dynamic> json) => _$GalleryWithDateFromJson(json);
}