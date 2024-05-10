import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontier_homepage/util/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../main.dart';
import '../../../../../util/global_variables.dart';

class MyTripsEmptyView extends StatefulWidget {
  const MyTripsEmptyView({super.key});

  @override
  State<MyTripsEmptyView> createState() => _MyTripsEmptyViewState();
}

class _MyTripsEmptyViewState extends State<MyTripsEmptyView> {
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
