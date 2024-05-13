import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/appcolor.dart';
import '../../../utils/appstring.dart';

class FlightDetailWidget extends StatelessWidget {
  bool isCheckedIn = true;
  FlightDetailWidget({super.key, required this.isCheckedIn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffDFDAC9)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: Text(
                  AppString.fightDetails,
                  style: GoogleFonts.montserrat(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: AppColor.stringBlackColor,
                  ),
                ),
              ),
            ),
            const Divider(thickness: 4, color: AppColor.stringBlue),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Wed, Jul 14, 2024 ",
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: AppColor.stringBlackColor,
                    ),
                  ),
                  Text(
                    "Confirmation: WFH7YT",
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: AppColor.stringBlackColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: isCheckedIn
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.depart,
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColor.stringBlackColor,
                        ),
                      ),
                      Text(
                        "8:55 AM",
                        style: GoogleFonts.montserrat(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: AppColor.stringBlackColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        isCheckedIn ? 'Ft Lauderdale' : 'Ft Lauderdale \n FFL',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: isCheckedIn ? 16 : 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColor.stringBlackColor,
                        ),
                      ),
                    ],
                  ),
                  isCheckedIn
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'F9 1176',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: AppColor.stringBlackColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            SizedBox(
                                height: 45,
                                width: 45,
                                child: Image.asset(
                                  'assets/appimage/airplane.png',
                                  fit: BoxFit.contain,
                                )),
                            // Text('LAS',textAlign: TextAlign.center, style: GoogleFonts.poppins(
                            //   fontSize: 12.0,
                            //             fontWeight: FontWeight.w400,
                            //             color: AppColor.stringBlackColor,

                            // ),)
                          ],
                        )
                      : Column(
                          children: [
                            Image.asset('assets/appimage/fightimage.png'),
                            Text(
                              'LAS',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: AppColor.stringBlackColor,
                              ),
                            ),
                          ],
                        ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.arrive,
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColor.stringBlackColor,
                        ),
                      ),
                      Text(
                        "11:00 AM",
                        style: GoogleFonts.montserrat(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: AppColor.stringBlackColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        isCheckedIn ? 'San Francisco' : 'San Francisco \n SFO',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: isCheckedIn ? 16 : 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColor.stringBlackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isCheckedIn)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 92,
                      height: 1,
                      color: Colors.green,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF4FAEE),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Text(
                          'On Time',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: AppColor.stringBlackColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 92,
                      height: 1,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            if (isCheckedIn)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Gate',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColor.stringBlackColor,
                          ),
                        ),
                        Text(
                          "J6",
                          style: GoogleFonts.montserrat(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            color: AppColor.stringBlackColor,
                          ),
                        ),
                        Text(
                          'Terminal A',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColor.stringBlackColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Boarding Starts',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColor.stringBlackColor,
                          ),
                        ),
                        Text(
                          "9:40 AM",
                          style: GoogleFonts.montserrat(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            color: AppColor.stringBlackColor,
                          ),
                        ),
                        Text(
                          'Boarding Zone: 1',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColor.stringBlackColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            Padding(
                padding:
                    const EdgeInsets.only(left: 18.0, right: 18.0, top: 20),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.primary,
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
                  height: 55,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      isCheckedIn
                          ? AppString.viewBordingPass
                          : AppString.checkIn,
                      style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: AppColor.whiteColor),
                    ),
                  ),
                )),
            const SizedBox(
              height: 6,
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, top: 20, bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.primary, width: 2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x27000000),
                        blurRadius: 19.56,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(0, 0.0),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  height: 55,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      AppString.manage,
                      style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
