import 'package:flutter/material.dart';
import 'package:mbc_common/mbc_common.dart';
import 'package:mbc_gallery/domain/model/gallery_item_model.dart';
import 'package:mbc_gallery/presentation/ui/widgets/image_widget.dart';

class GalleryListWidget extends StatelessWidget {
  final List<GalleryItemModel> wellnessList;
  final VoidCallback onTap;
  const GalleryListWidget({super.key, required this.wellnessList, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.inverseTextColor,
      child: wellnessList.isEmpty
          ? const EmptyGalleryWidget()
          : GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: wellnessList.length,
              padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen(context)
                      ? 16
                      : isMediumScreen(context)
                          ? 25
                          : 40, vertical: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getNumberOfColumns(context),
                crossAxisSpacing: isLargeScreen(context) ? 25 : 25.0,
                mainAxisSpacing: isLargeScreen(context) ? 25 : 16.0,
              ),
              itemBuilder: (context, index) {
                final item = wellnessList[index];
                return HoverableCard(
                  galleryItem: item,
                  onTap: onTap,
                );
              },
            ),
    );
  }
}

class HoverableCard extends StatefulWidget {
  final GalleryItemModel galleryItem;
  final VoidCallback onTap;

  const HoverableCard({
    super.key,
    required this.galleryItem,
    required this.onTap,
  });

  @override
  _HoverableCardState createState() => _HoverableCardState();
}

class _HoverableCardState extends State<HoverableCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: () {
          widget.onTap();
        },
        child: AnimatedScale(
          scale: isHovered ? 1.04 : 1.0, // Slightly larger scale on hover
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          child: Card(
            elevation: isHovered ? 7 : 4, // Higher elevation on hover
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SizedBox(
              width: isLargeScreen(context)? 200: 150,
              height: isLargeScreen(context)? 200: 150,
              child: ImageWidget(
                width: isLargeScreen(context)? 200: 150,
                height: isLargeScreen(context)? 200: 150,
                url: widget.galleryItem.image,
                isCover: true,
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
    return SingleChildScrollView(
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
        ],
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
