import 'package:flutter/material.dart';
import 'package:frontier_homepage/utils/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class SaveBigWidget extends StatelessWidget {
  const SaveBigWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Container(
        height: 305,
        decoration: const BoxDecoration(
          color: AppColor.greenColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 86.52,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/appimage/savebig.png'))),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: const BoxDecoration(color: AppColor.whiteColor),
              height: 200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/appimage/iconh1_discountden.png'))),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Kids Fly Free',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                    text:
                                        ' and access our \nlowest fares all year when \nyou sign up to be a member.',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.stringBlackColor)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 8.0, right: 8.0),
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColor.greenColor, width: 2.0),
                        color: AppColor.whiteColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                      child: Center(
                        child: Text('Sign Up Now',
                            style: GoogleFonts.poppins(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primary)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
