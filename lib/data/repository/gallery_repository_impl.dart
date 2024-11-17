import 'dart:isolate';

import 'package:mbc_common/mbc_common.dart';
import 'package:mbc_gallery/data/api/gallery_api.dart';
import 'package:mbc_gallery/data/dto/gallery_list_response.dart';
import 'package:mbc_gallery/data/repository/igallery_repository.dart';
import 'package:mbc_gallery/domain/model/gallery_item_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';
part 'gallery_repository_impl.g.dart';

@Riverpod(keepAlive: true)
GalleryRepositoryImpl galleryRepositoryImpl(GalleryRepositoryImplRef ref) {
  final galleryApiService = ref.watch(galleryApiProvider);
  return GalleryRepositoryImpl(galleryApiService);
}

class GalleryRepositoryImpl
    with DioExceptionMixin
    implements IGalleryRepository {
  final GalleryApi _galleryApiService;
  GalleryRepositoryImpl(this._galleryApiService);

  @override
  Future<List<GalleryItemModel>> getGalleryImages() async {

    final galleryListResponse = await callApi<GalleryListResponse>(
            () => _galleryApiService.getGalleryMockData());

    final galleryList = compute(mapToGalleryModel,
      galleryListResponse.gallery,
    );
    return galleryList;
  }

}

List<GalleryItemModel> mapToGalleryModel(
    List<Gallery> data,
    ) {
  final result = data
      .map(
        (e) => GalleryItemModel(
      image: e.image,
    ),
  )
      .toList();

  return result;
}