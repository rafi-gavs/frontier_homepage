import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/appcolor.dart';

class IndividualSearchResultPage extends StatefulWidget {
  const IndividualSearchResultPage({super.key});

  @override
  State<IndividualSearchResultPage> createState() => _IndividualSearchResultPageState();
}

class _IndividualSearchResultPageState extends State<IndividualSearchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgCream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              _header(),
              const SizedBox(height: 24.0),
              _card(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Image.asset(
            'assets/appimage/arrow_back.png',
            height: 24.0,
            width: 24.0,
          ),
          const SizedBox(width: 20.0),
          Text(
            'Back to results',
            style: GoogleFonts.poppins(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: AppColor.stringBlackColor,
            ),
          )
        ],
      ),
    );
  }

  Widget _card() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffDFDAC9),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FLIGHT 4444',
                style: GoogleFonts.montserrat(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: AppColor.stringBlackColor,
                ),
              ),
              _chip(context, 'Arrived'),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Image.asset(
                'assets/appimage/bear.png',
                height: 40.0,
                width: 40.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                'Blanco the Polar Bear',
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: AppColor.stringBlackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Actual',
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
              Text(
                'Actual',
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '8:55 AM',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: AppColor.stringBlackColor,
                  ),
                ),
                Text(
                  '--------------',
                  style: GoogleFonts.poppins(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                    color: AppColor.grey,
                  ),
                ),
                Text(
                  '11:10 AM',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: AppColor.stringBlackColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Scheduled',
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
              Text(
                'Scheduled',
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '8:58 AM',
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
              Text(
                '11:30 AM',
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Denver',
                    style: GoogleFonts.poppins(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: AppColor.stringBlackColor,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '(DEN)',
                    style: GoogleFonts.poppins(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: AppColor.stringBlackColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'San Diego',
                    style: GoogleFonts.poppins(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: AppColor.stringBlackColor,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '(SAN)',
                    style: GoogleFonts.poppins(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: AppColor.stringBlackColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Container(
            height: 1,
            color: AppColor.borderColor,
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gate',
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
              Text(
                'Gate',
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'C42',
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: AppColor.stringBlackColor,
                ),
              ),
              Text(
                'A25',
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: AppColor.stringBlackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Terminal 3',
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColor.stringBlackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Baggage Claim',
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Carousel 3',
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: AppColor.stringBlackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(BuildContext context, String value) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.chipsColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: Text(
        value,
        style: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: AppColor.stringBlackColor,
        ),
      ),
    );
  }
}
