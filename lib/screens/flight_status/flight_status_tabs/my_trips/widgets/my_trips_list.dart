import 'package:flutter/material.dart';
import 'package:frontier_homepage/utils/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/global_variables.dart';

class MyTripsList extends StatelessWidget {
  const MyTripsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          {
            'text_1': 'April 1st, 2024',
            'text_2': 'One Way',
            'title': 'DEN to SAN',
          },
          {
            'text_1': 'April 9th, 2024',
            'text_2': 'Round Trip',
            'title': 'SAN to AUS',
          },
        ].map((e) => _listItem(e)).toList(),
      ),
    );
  }

  Widget _listItem(Map<String, String> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: AppColor.borderColor,
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data['text_1']!,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.stringBlackColor,
              ),
            ),
            Text(
              data['text_2']!,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColor.fontSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          data['title']!,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColor.stringBlackColor,
          ),
        ),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: () {
            myTripsViewStackIndex.value = 1;
          },
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
      ],
    );
  }
}
