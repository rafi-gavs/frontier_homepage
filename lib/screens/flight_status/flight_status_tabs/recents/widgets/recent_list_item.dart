import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../util/appcolor.dart';

class RecentListItem extends StatefulWidget {
  final String? number;
  final String date;
  final void Function()? onViewFlightTap;
  const RecentListItem({
    super.key,
    this.number,
    required this.date,
    this.onViewFlightTap,
  });

  @override
  State<RecentListItem> createState() => _RecentListItemState();
}

class _RecentListItemState extends State<RecentListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Text(
          widget.date,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColor.fontSecondary,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'DEN to SAN',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColor.stringBlackColor,
          ),
        ),
        Visibility(
          visible: widget.number != null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              Text(
                'F9 4444',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.fontSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: widget.onViewFlightTap,
          child: Text(
            'View Flights',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColor.linkText,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        const Divider(),
      ],
    );
  }
}
