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
    @JsonKey(name: "gallery")
    required List<Gallery> gallery,
  }) = _GalleryListResponse;

  factory GalleryListResponse.fromJson(Map<String, dynamic> json) => _$GalleryListResponseFromJson(json);
}

@freezed
class Gallery with _$Gallery {
  const factory Gallery({
    @JsonKey(name: "image")
    required String image,
  }) = _Gallery;

  factory Gallery.fromJson(Map<String, dynamic> json) => _$GalleryFromJson(json);
}
