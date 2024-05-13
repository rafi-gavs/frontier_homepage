import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/appcolor.dart';
import '../../../components/app_button.dart';
import '../../../components/app_text_field.dart';

class ByNumberForm extends StatefulWidget {
  const ByNumberForm({super.key});

  @override
  State<ByNumberForm> createState() => _ByNumberFormState();
}

class _ByNumberFormState extends State<ByNumberForm> {
  final DateTime _selectedDate = DateTime.now();
  final double _kPickerSheetHeight = 216.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _form(),
      ],
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
                'Flight Number',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
              const SizedBox(height: 6.0),
              const AppTextField(),
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
              AppTextField(
                initialValue: 'Friday, April 5th, 2024',
                readOnly: true,
                onTap: () {
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return _buildBottomPicker(
                        CupertinoDatePicker(
                          showDayOfWeek: true,
                          maximumDate: _selectedDate.add(
                            const Duration(days: 1),
                          ),
                          minimumDate: _selectedDate.subtract(
                            const Duration(days: 1),
                          ),
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: _selectedDate,
                          onDateTimeChanged: (DateTime newDateTime) {},
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 16.0),
              const AppButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.systemGrey3,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
}
