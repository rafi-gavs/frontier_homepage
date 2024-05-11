import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/appcolor.dart';

class SearchResultHeader extends StatelessWidget {
  final void Function()? onBackTap;
  final void Function()? onRefreshTap;
  final String title;
  final String lastRefreshedDate;
  const SearchResultHeader({
    super.key,
    this.onBackTap,
    this.onRefreshTap,
    required this.lastRefreshedDate,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        const SizedBox(height: 16.0),
        _resultFoundInfo(),
      ],
    );
  }

  Widget _header() {
    return Row(
      children: [
        GestureDetector(
          onTap: onBackTap,
          child: Image.asset(
            'assets/appimage/arrow_back_search_result.png',
            height: 22.0,
            width: 18.0,
          ),
        ),
        const SizedBox(width: 16.0),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: AppColor.stringBlackColor,
          ),
        )
      ],
    );
  }

  Widget _resultFoundInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '[3] Flights Found',
          style: GoogleFonts.poppins(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColor.stringBlackColor,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Text(
              'Last refreshed $lastRefreshedDate.',
              style: GoogleFonts.poppins(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: AppColor.stringBlackColor,
              ),
            ),
            const SizedBox(width: 4.0),
            GestureDetector(
              onTap: onRefreshTap,
              child: Text(
                'Refresh now.',
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColor.stringBlackColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
