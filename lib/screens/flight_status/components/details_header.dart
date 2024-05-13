import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/appcolor.dart';

class DetailsHeader extends StatelessWidget {
  final void Function()? onBackTap;
  final String title;
  const DetailsHeader({
    super.key,
    this.onBackTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBackTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Image.asset(
              'assets/appimage/arrow_back_search_result.png',
              height: 22.0,
              width: 18.0,
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: AppColor.stringBlackColor,
          ),
        )
      ],
    );
  }
}
