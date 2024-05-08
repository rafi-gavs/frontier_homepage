import 'package:flutter/material.dart';
import 'package:frontier_homepage/util/appcolor.dart';
import 'package:frontier_homepage/util/appstring.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

class WelcomeCard extends StatefulWidget {
  const WelcomeCard({
    super.key,
  });

  @override
  State<WelcomeCard> createState() => _WelcomeCardState();
}

class _WelcomeCardState extends State<WelcomeCard> {
  @override
  void initState() {
    super.initState();
  }

  String _getName() {

    String? username = nPrefs.getString('username');
    if (username == null) {
      return AppString.welcomeTheodore;
    }

    return 'Welcome $username';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: 5.0,
              decoration: const BoxDecoration(
                color: AppColor.yellowColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0)),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.89,
              decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _getName(),
                          style: GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.w700, color: AppColor.stringBlackColor),
                        ),
                        const Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                    Text(
                      AppString.miles,
                      style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w400, color: AppColor.stringBlackColor),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColor.yellowColor,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(AppString.eliteGold,
                            style: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColor.stringBlackColor)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
