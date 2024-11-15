import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_item_model.freezed.dart';

@freezed
class GalleryItemModel with _$GalleryItemModel {
  const factory GalleryItemModel({
    required String image,
  }) = _GalleryItemModel;
}
