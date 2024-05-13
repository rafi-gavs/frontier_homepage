import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontier_homepage/utils/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/global_variables.dart';

class MyTripsEmpty extends StatefulWidget {
  const MyTripsEmpty({super.key});

  @override
  State<MyTripsEmpty> createState() => _MyTripsEmptyState();
}

class _MyTripsEmptyState extends State<MyTripsEmpty> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'You have no upcoming trips. ',
        style: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: AppColor.stringBlackColor,
        ),
        children: isLoggedIn
            ? []
            : <TextSpan>[
                TextSpan(
                  text: 'Join Frontier Miles',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: AppColor.linkText,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      //add your onTap code here
                    },
                ),
                TextSpan(
                  text: ' for free and you can view upcoming trips!',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: AppColor.stringBlackColor,
                  ),
                ),
              ],
      ),
    );
  }
}
