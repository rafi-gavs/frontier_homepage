
import 'package:flutter/material.dart';
import 'package:frontier_homepage/util/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: Color(0xFFE3DDD0))),
        color: AppColor.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.home,
                color: AppColor.primary,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Home',
                style: GoogleFonts.poppins(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: AppColor.primary),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Icon(Icons.flight_takeoff_outlined),
              SizedBox(
                height: 5,
              ),
              Text(
                'Book',
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Icon(Icons.margin_rounded),
              SizedBox(
                height: 5,
              ),
              Text(
                'My Trip',
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Icon(Icons.access_time_outlined),
              SizedBox(
                height: 5,
              ),
              Text(
                'Status',
                style: GoogleFonts.poppins(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: AppColor.primary),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Icon(Icons.more_vert_sharp),
              SizedBox(
                height: 5,
              ),
              Text(
                'More',
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
 