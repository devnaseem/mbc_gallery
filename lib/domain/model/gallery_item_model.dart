import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_item_model.freezed.dart';

@freezed
class GalleryItemModel with _$GalleryItemModel {
  const factory GalleryItemModel({
  required DateTime date,
  required List<String> images,
    required
  }) = _GalleryItemModel;
}
