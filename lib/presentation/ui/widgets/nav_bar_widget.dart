import 'package:flutter/material.dart';
import 'package:mbc_common/mbc_common.dart';
import 'package:google_fonts/google_fonts.dart';


class NavBarWidget extends StatelessWidget implements PreferredSizeWidget{
  final VoidCallback onBackPressed;
  const NavBarWidget({super.key, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Text("Gallery", style: GoogleFonts.breeSerif(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            letterSpacing: -1,
            height: 1.5,
            color: ColorConstants.primaryBrandColor),),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68);
}
