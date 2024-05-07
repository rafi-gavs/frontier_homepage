
import 'package:flutter/material.dart';
import 'package:frontier_homepage/util/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';


class RecentSearchList extends StatelessWidget {
  const RecentSearchList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color(0xFFE3DDD0)),
                color: AppColor.whiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.40,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Denver - Atlanta',
                        style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColor.stringBlackColor)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Feb 12 - Jan 18',
                        style: GoogleFonts.poppins(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF676460))),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color(0xFFE3DDD0)),
                color: AppColor.whiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.40,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Denver - Atlanta',
                        style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColor.stringBlackColor)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Feb 12 - Jan 18',
                        style: GoogleFonts.poppins(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF676460))),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color(0xFFE3DDD0)),
                color: AppColor.whiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.40,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Denver - Atlanta',
                        style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColor.stringBlackColor)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Feb 12 - Jan 18',
                        style: GoogleFonts.poppins(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF676460))),
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
  