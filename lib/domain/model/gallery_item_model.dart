import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_item_model.freezed.dart';


@freezed
class GalleryItemModel with _$GalleryItemModel {
  const factory GalleryItemModel({
    required String id,
    required DateTime createdAt,
    required String visitId,
    required List<PhotoModel> photos,
   required Map<String, LikeDetailModel> likes,
  }) = _GalleryItemModel;

}

@freezed
class PhotoModel with _$PhotoModel {
  const factory PhotoModel({
    required String url,
    required ResolutionModel resolution,
  }) = _PhotoModel;

}

@freezed
class ResolutionModel with _$ResolutionModel {
  const factory ResolutionModel({
    required int quality,
    bool? zoom,
    required String format,
    int? width,
    int? height,
  }) = _ResolutionModel;

}

@freezed
class LikeDetailModel with _$LikeDetailModel {
  const factory LikeDetailModel({
    required DateTime likeAt,
  }) = _LikeDetailModel;

}
