import 'package:mbc_gallery/data/dto/gallery_list_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:mbc_core/mbc_core.dart';

part 'gallery_api.g.dart';

final galleryApiProvider = Provider<GalleryApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return GalleryApi(dio);
});

@RestApi(
    parser: Parser.FlutterCompute,
)
abstract class GalleryApi {
  factory GalleryApi(Dio dio) => _GalleryApi(dio);

  @GET('gallery')
  Future<GalleryListResponse> getGalleryMockData();
}
