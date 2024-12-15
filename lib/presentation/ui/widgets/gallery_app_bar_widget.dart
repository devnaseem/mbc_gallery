import 'package:flutter/material.dart';
import 'package:mbc_common/mbc_common.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onFilterPressed;
  const GalleryAppBarWidget({super.key, required this.onFilterPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryBrandColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Gallery",
              style: GoogleFonts.breeSerif(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1,
                  height: 1.5,
                  color: Colors.white),
            ),
            InkWell(
              onTap: () {
                onFilterPressed();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.filter_list,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    "FILTER",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.5,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
