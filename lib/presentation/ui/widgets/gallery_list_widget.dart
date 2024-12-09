import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mbc_common/mbc_common.dart';
import 'package:mbc_gallery/domain/model/gallery_item_model.dart';
import 'package:mbc_gallery/presentation/ui/widgets/image_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mbc_gallery/presentation/view_model/gallery_view_model.dart';

class GalleryListWidget extends ConsumerWidget {
  final List<GalleryItemModel> galleryPhotosList;
  final Function(String) onTap;
  final ScrollController scrollController;

  const GalleryListWidget({super.key, required this.galleryPhotosList, required this.onTap, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingMore = ref.watch(galleryViewModelProvider.select((state) => state.isLoadingMore));

    final child = Container(
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 32)),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Text(
                "These photos will be stored securely for 1 year. Please check the Privacy and consent for more details.",
                style: GoogleFonts.openSans(
                    fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: -0.5, height: 1.5, color: const Color(0xFF51534A)),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Gallery Items Slivers
          if (galleryPhotosList.isEmpty)
            const SliverToBoxAdapter(child: EmptyGalleryWidget())
          else
            ...buildGalleryItems(context),

          if (isLoadingMore)
            const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );

    return kIsWeb? Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
          boxShadow: [
            const BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: Offset(1.0, 1.0),
            ),
          ],
      ),
      child: child,
    ): ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      child: Container(
        color: ColorConstants.inverseTextColor,
        child: child
      ),
    );
  }

  String getCurrentScreenDimension(BuildContext context){
    if(isSmallScreen(context))
      return "Small";
    else  if(isMediumScreen(context))
      return "Medium";
    else  if(isLargeScreen(context))
      return "Large";
    else
      return "Desktop";

  }

  List<Widget> buildGalleryItems(BuildContext context) {
    List<Widget> slivers = [];

    final photosByDate = <DateTime, List<GalleryItemModel>>{};

    for (var item in galleryPhotosList) {
      final date = DateTime(
        item.createdAt.year,
        item.createdAt.month,
        item.createdAt.day,
      );

      photosByDate.putIfAbsent(date, () => []);
      photosByDate[date]!.add(item);
    }

    final sortedDates = photosByDate.keys.toList()
      ..sort((a, b) => b.compareTo(a));


    for (final date in sortedDates) {
      final datePhotos = photosByDate[date]!;
      final dateString = DateFormat('MMMM d, y').format(date);

      // Add a date header
      slivers.add(
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              dateString,
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
                height: 1.5,
                color: const Color(0xFF51534A),
              ),
            ),
          ),
        ),
      );

      // Add a 2-column grid of photos for this date
      slivers.add(
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: getHorizontalPadding(context),
            vertical: 16,
          ),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getNumberOfColumns(context),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final photoItem = datePhotos[index];
                final itemHeight = getHeight(context); // Your custom function

                return SizedBox(
                  height: itemHeight+ (isDesktopScreen(context)? 150:38),
                  child: HoverableCard(
                    galleryItem: photoItem,
                    onTap: onTap,
                    height: itemHeight,
                    isLiked: index % 2 == 0, // Example logic for isLiked
                  ),
                );
              },
              childCount: datePhotos.length,
            ),
          ),
        ),
      );
    }

    return slivers;
  }


/*  double getHeight(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPaddingOffset = isSmallScreen(context)? 27: isMediumScreen(context) ? 12 : 0;
    final desktopScreenPadding = screenWidth * 0.2;
    final viewPortWidth = isDesktopScreen(context)? (screenWidth - desktopScreenPadding) : screenWidth;
    return (viewPortWidth/2)-(getHorizontalPadding(context) * 2) - horizontalPaddingOffset;
  }*/

  double getHeight(BuildContext context) {
    return isSmallScreen(context)? 155 :  200;
  }

  double getHorizontalPadding(BuildContext context){
   return 10;
  }
}




class HoverableCard extends StatefulWidget {
  final GalleryItemModel galleryItem;
  final Function(String) onTap;
  final double height;
  final bool isLiked;

  const HoverableCard({
    super.key,
    required this.galleryItem,
    required this.onTap,
    required this.height,
    required this.isLiked,
  });

  @override
  _HoverableCardState createState() => _HoverableCardState();
}

class _HoverableCardState extends State<HoverableCard> {
  bool isHovered = false;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) {
         if(mounted) {
           isLiked = widget.isLiked;
         }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height+(isDesktopScreen(context)? 150:38),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: InkWell(
          onTap: () {
            widget.onTap(widget.galleryItem.photos[2].url);
          },
          child: AnimatedScale(
            scale: isHovered ? 1.04 : 1.0, // Slightly larger scale on hover
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: isHovered ? 7 : 1, // Higher elevation on hover
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: SizedBox(
                        height: widget.height,
                        child: Hero(
                          tag: widget.galleryItem.photos[2].url,
                          child: ImageWidget(
                            width:  widget.height,
                            height:  widget.height,
                            url: widget.galleryItem.photos[0].url,
                            isCover: true,
                            id: widget.galleryItem.id,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                         InkWell(
                             onTap: () {
                               setState(() {
                                 isLiked = !isLiked;
                               });
                             },
                             child: Icon(isLiked? Icons.favorite : Icons.favorite_outline, color: ColorConstants.primaryBrandColor, size: 20)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyGalleryWidget extends StatelessWidget {
  const EmptyGalleryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        color: ColorConstants.inverseTextColor,
        width: double.infinity,
        child: Text(
          "${AppLocalizations.of(context)!.translate("text_no_wellness_status_recorded")}",
        ),
      ),
    );
  }
}

class GalleryLoadingWidget extends StatelessWidget {
  const GalleryLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            SkeletonItemLoader(),
            const SizedBox(
              height: 16,
            ),
            SkeletonItemLoader(),
            const SizedBox(
              height: 16,
            ),
            SkeletonItemLoader(),
            const SizedBox(
              height: 16,
            ),
            SkeletonItemLoader(),
            const SizedBox(
              height: 16,
            ),
            SkeletonItemLoader(),
          ],
        ),
      ),
    );
  }
}

bool isSmallScreen(BuildContext context) => MediaQuery.of(context).size.width < BreakPoint.small;

bool isMediumScreen(BuildContext context) =>
    MediaQuery.of(context).size.width >= BreakPoint.small && MediaQuery.of(context).size.width < BreakPoint.medium;

bool isLargeScreen(BuildContext context) => MediaQuery.of(context).size.width >= BreakPoint.medium && MediaQuery.of(context).size.width < BreakPoint.large;

bool isDesktopScreen(BuildContext context) => MediaQuery.of(context).size.width >= BreakPoint.large;

int getNumberOfColumns(BuildContext context) {
  if (isDesktopScreen(context)) {
    return 3;
  }
  else if (isLargeScreen(context)) {
    return 3;
  } else if (isMediumScreen(context)) {
    return 2;
  } else {
    return 2;
  }
}

abstract class BreakPoint {

  static const double small = 600;

  static const double medium = 900;

  static const double large = 1200;

  static const double desktop = 1200;
}

