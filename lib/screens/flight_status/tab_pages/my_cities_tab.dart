import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/appcolor.dart';
import '../components/app_button.dart';
import '../components/app_text_field.dart';

class MyCitiesTab extends StatefulWidget {
  const MyCitiesTab({super.key});

  @override
  State<MyCitiesTab> createState() => _MyCitiesTabState();
}

class _MyCitiesTabState extends State<MyCitiesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bgCream,
      child: _form(),
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
              const AppTextField(
                initialValue: 'Denver, CO (DEN)',
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
              const AppTextField(
                initialValue: 'San, Diego, CA (SAN)',
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
