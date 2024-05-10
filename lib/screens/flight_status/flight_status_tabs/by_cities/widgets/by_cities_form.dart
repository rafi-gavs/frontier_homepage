import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../util/appcolor.dart';
import '../../../components/app_button.dart';
import '../../../components/app_text_field.dart';
import '../../../flight_status_page.dart';
import 'by_cities_form_error_view.dart';

class ByCitiesForm extends StatefulWidget {
  const ByCitiesForm({super.key});

  @override
  State<ByCitiesForm> createState() => _ByCitiesFormState();
}

class _ByCitiesFormState extends State<ByCitiesForm> {
  @override
  Widget build(BuildContext context) {
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
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: SearchErrorMessage(),
              ),
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
                initialValue: 'Denver, CO (DEN)',
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
                initialValue: 'San, Diego, CA (SAN)',
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
                initialValue: 'Friday, April 5th, 2024',
                readOnly: true,
              ),
              const SizedBox(height: 24.0),
              AppButton(
                onPressed: () {
                  //byCitiesSearchStackIndex.value = 1;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
