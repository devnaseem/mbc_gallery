import 'package:mbc_gallery/domain/model/gallery_item_model.dart';

abstract interface class IGalleryRepository {
  Future<List<GalleryItemModel>> getGalleryImages(String psId, int page);
  Future<List<GalleryItemModel>> getGalleryImagesForDateRange(
      String psId, int page, String startDate, String endDate);
}
