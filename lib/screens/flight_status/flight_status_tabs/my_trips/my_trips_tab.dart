import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../util/appcolor.dart';
import '../../components/app_button.dart';
import '../../components/app_text_field.dart';
import 'widgets/my_trips_empty_view.dart';
import '../../flight_status_page.dart';

class MyTripsTab extends StatefulWidget {
  const MyTripsTab({super.key});

  @override
  State<MyTripsTab> createState() => _MyTripsTabState();
}

class _MyTripsTabState extends State<MyTripsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      color: AppColor.bgCream,
      child: _form(),
      //child: const MyTripsEmptyView(),
    );
  }

  Widget _form() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            border: Border.all(
              color: const Color(0xffDFDAC9),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Departure',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
              const SizedBox(height: 6.0),
              AppTextField(
                readOnly: true,
                onTap: () {
                  fsScaffoldKey.currentState!.openDrawer();
                },
              ),
              const SizedBox(height: 16.0),
              Text(
                'Arrival',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
              const SizedBox(height: 6.0),
              AppTextField(
                readOnly: true,
                onTap: () {
                  fsScaffoldKey.currentState!.openDrawer();
                },
              ),
              const SizedBox(height: 16.0),
              Text(
                'Flight Date',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
              const SizedBox(height: 6.0),
              const AppTextField(
                readOnly: true,
                initialValue: 'Friday, April 5th, 2024',
              ),
              const SizedBox(height: 24.0),
              const AppButton(),
            ],
          ),
        ),
      ],
    );
  }
}
