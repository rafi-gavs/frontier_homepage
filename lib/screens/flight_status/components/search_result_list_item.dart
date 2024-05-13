import 'package:flutter/material.dart';
import 'package:frontier_homepage/utils/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultListItem extends StatelessWidget {
  final void Function()? onTap;
  final String flightNumber;
  final String badgeOption;
  final String departTime;
  final String arriveTime;
  final String departFrom;
  final String arriveTo;
  final String? connectionFrom;
  final String? connectionTo;
  const SearchResultListItem({
    super.key,
    required this.flightNumber,
    required this.badgeOption,
    required this.departTime,
    required this.arriveTime,
    required this.departFrom,
    required this.arriveTo,
    this.connectionFrom,
    this.connectionTo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                  flightNumber,
                  style: GoogleFonts.montserrat(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: AppColor.stringBlackColor,
                  ),
                ),
                _chip(context, badgeOption),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Depart',
                  style: GoogleFonts.poppins(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: AppColor.stringBlackColor,
                  ),
                ),
                Text(
                  'Arrive',
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
                    departTime,
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: AppColor.stringBlackColor,
                    ),
                  ),
                  Visibility(
                    visible: connectionFrom == null || connectionTo == null,
                    replacement: Row(
                      children: [
                        Text(
                          '------',
                          style: GoogleFonts.poppins(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grey,
                          ),
                        ),
                        Image.asset(
                          'assets/appimage/airplane.png',
                          height: 16.0,
                          width: 16.0,
                        ),
                        Text(
                          '------',
                          style: GoogleFonts.poppins(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grey,
                          ),
                        ),
                      ],
                    ),
                    child: Text(
                      '--------------',
                      style: GoogleFonts.poppins(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                  Text(
                    arriveTime,
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: AppColor.stringBlackColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      departFrom,
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: AppColor.stringBlackColor,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      '(${departFrom.toUpperCase().substring(0, 3)})',
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColor.stringBlackColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      arriveTo,
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: AppColor.stringBlackColor,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      '(${arriveTo.toUpperCase().substring(0, 3)})',
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColor.stringBlackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Visibility(
              visible: connectionFrom != null && connectionTo != null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    height: 1,
                    color: AppColor.borderColor,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Connection',
                    style: GoogleFonts.poppins(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: AppColor.stringBlackColor,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text(
                        'LAS',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: AppColor.stringBlackColor,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Image.asset(
                        'assets/appimage/arrow.png',
                        height: 20.0,
                        width: 20.0,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        'SAN',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: AppColor.stringBlackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
