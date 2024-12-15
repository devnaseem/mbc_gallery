import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mbc_common/mbc_common.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbc_gallery/presentation/ui/widgets/gallery_utils.dart';

class NavBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onFilterPressed;

  const NavBarWidget(
      {super.key, required this.onBackPressed, required this.onFilterPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (kIsWeb && isDesktopScreen(context))
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
              ),
            Text(
              "Gallery",
              style: GoogleFonts.breeSerif(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1,
                  height: 1.5,
                  color: ColorConstants.primaryBrandColor),
            ),
            InkWell(
              onTap: () {
                onFilterPressed();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.filter_list,
                    color: ColorConstants.primaryBrandColor,
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
                        color: ColorConstants.primaryBrandColor,
                        height: 1.5,
                        decoration: TextDecoration.underline,
                        decorationColor: ColorConstants.primaryBrandColor),
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
  Size get preferredSize => const Size.fromHeight(68);
}
