import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../util/appcolor.dart';

class ByCitiesFormError extends StatelessWidget {
  const ByCitiesFormError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 14.0,
      ),
      decoration: BoxDecoration(
        color: AppColor.toastErrorBgColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/appimage/status_search_error.png',
            height: 24.0,
            width: 24.0,
          ),
          const SizedBox(width: 10.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No Flights Found',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: AppColor.stringBlackColor,
                  ),
                ),
                SizedBox(
                  width: 220.0,
                  child: Text(
                    'Please revise your search criteria or check back later.',
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: AppColor.stringBlackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
