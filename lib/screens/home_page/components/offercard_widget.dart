import 'package:flutter/material.dart';
import 'package:frontier_homepage/utils/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/appstring.dart';


class OfferCardWidget extends StatelessWidget {
  const OfferCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 190),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x27000000),
              blurRadius: 19.56,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 0.0),
              spreadRadius: 0,
            ),
          ],
        ),
        height: 61,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0)),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(Icons.arrow_back_ios_sharp),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(AppString.offer,
                      style: GoogleFonts.poppins(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: AppColor.stringBlue))
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColor.lightBlue,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppString.saveOnSummerTravel,
                          style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: AppColor.stringBlue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(AppString.usePromoCode,
                              style: GoogleFonts.poppins(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.stringBlue)),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(AppString.save,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      decoration: TextDecoration
                                          .underline),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.stringBlue)),
                        ],
                      )
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            )
         
          ],
    
        ),
      ),
    );
  }
}

