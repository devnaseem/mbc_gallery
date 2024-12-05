import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mbc_common/mbc_common.dart';
import 'package:mbc_gallery/domain/model/gallery_item_model.dart';
import 'package:mbc_gallery/presentation/ui/widgets/image_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GalleryListWidget extends StatelessWidget {
  final List<GalleryItemModel> wellnessList;
  final Function(String) onTap;
  const GalleryListWidget({super.key, required this.wellnessList, required this.onTap});

  @override
  Widget build(BuildContext context) {

    final child = ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "These photos will be stored securely for 1 year. Please check the  Privacy and consent for more details.",
            style: GoogleFonts.openSans(
                fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: -0.5, height: 1.5, color: const Color(0xFF51534A)),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        wellnessList.isEmpty
            ? const EmptyGalleryWidget()
            : ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: wellnessList.length,
          itemBuilder: (BuildContext context, int index) {
            final galleryItem = wellnessList[index];
            final DateFormat formatter = DateFormat('MMMM d, y');

            return ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    formatter.format(galleryItem.date),
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                        height: 1.5,
                        color: const Color(0xFF51534A)),
                  ),
                ),
                MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                  padding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen(context)
                          ? 10
                          : isMediumScreen(context)
                          ? 25
                          : 40,
                      vertical: 16),
                  shrinkWrap: true,
                  itemCount: galleryItem.images.length, // it
                  physics: const ClampingScrollPhysics(), // emCount
                  itemBuilder: (context, index) {
                    final item = galleryItem.images[index];
                    final itemHeight = getHeight(index % 4);
                    return SizedBox(
                      height: itemHeight,
                      child: HoverableCard(
                        galleryItem: item,
                        onTap: onTap,
                        height: itemHeight,
                        isLiked: index %2 == 0,
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );

    return kIsWeb? Container(
      margin: EdgeInsets.all(20),
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

  double getHeight(int itemTypeIndex) {
    switch (itemTypeIndex) {
      case 0:
        return 229;
      case 1:
        return 187;
      case 2:
        return 229;
      case 3:
        return 187;
      default:
        return 187;
    }
  }
}

class HoverableCard extends StatefulWidget {
  final String galleryItem;
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
       setState(() {
         isLiked = widget.isLiked;
       });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: InkWell(
          onTap: () {
            widget.onTap(widget.galleryItem);
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
                        height: isLargeScreen(context) ? 300 : widget.height-38,
                        child: Hero(
                          tag: widget.galleryItem,
                          child: ImageWidget(
                            width: isLargeScreen(context) ? 400 : 200,
                            height: isLargeScreen(context) ? 300 : widget.height-38,
                            url: widget.galleryItem,
                            isCover: true,
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

bool isSmallScreen(BuildContext context) => MediaQuery.of(context).size.width < BreakPoint.tablet;

bool isMediumScreen(BuildContext context) =>
    MediaQuery.of(context).size.width >= BreakPoint.tablet && MediaQuery.of(context).size.width < BreakPoint.desktop;

bool isLargeScreen(BuildContext context) => MediaQuery.of(context).size.width > BreakPoint.desktop;

int getNumberOfColumns(BuildContext context) {
  if (isLargeScreen(context)) {
    return 6;
  } else if (isMediumScreen(context)) {
    return 4;
  } else {
    return 2;
  }
}

abstract class BreakPoint {
  static const double desktop = 900;
  static const double tablet = 600;
}

enum PhotoSize { v1, v2 }
