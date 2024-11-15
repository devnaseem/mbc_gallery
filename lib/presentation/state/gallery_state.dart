import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mbc_gallery/domain/model/gallery_item_model.dart';

part 'gallery_state.freezed.dart';

@freezed
abstract class GalleryState with _$GalleryState {
  const factory GalleryState({
    @Default(AsyncLoading()) AsyncValue<List<GalleryItemModel>> galleryList,
  }) = _GalleryState;
}
