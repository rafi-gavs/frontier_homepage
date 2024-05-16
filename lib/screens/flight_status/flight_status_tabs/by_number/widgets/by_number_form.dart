import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontier_homepage/util/app_extensions.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../util/app_date_picker.dart';
import '../../../../../util/appcolor.dart';
import '../../../../../util/global_variables.dart';
import '../../../components/app_button.dart';
import '../../../components/app_text_field.dart';

class ByNumberForm extends StatefulWidget {
  const ByNumberForm({super.key});

  @override
  State<ByNumberForm> createState() => _ByNumberFormState();
}

class _ByNumberFormState extends State<ByNumberForm> {
  DateTime _selectedDate = DateTime.now();
  final double _kPickerSheetHeight = 216.0;
  late TextEditingController _flightNumber;
  late TextEditingController _flightDate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _flightNumber = TextEditingController();
    _flightDate = TextEditingController(text: _selectedDate.toEEEEMMMMdyyyy());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _flightDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _form(),
      ],
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
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
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 16.0,
            ),
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
                AppTextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  controller: _flightNumber,
                  showSuffixIcon: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Flight number is required';
                    }
                    return null;
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
                AppTextField(
                  controller: _flightDate,
                  readOnly: true,
                  onTap: () {
                    AppDatePicker.showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      onSelectedDateChanged: (date) {
                        _selectedDate = date;
                        _flightDate.text = _selectedDate.toEEEEMMMMdyyyy();
                        setState(() {});
                      },
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                AppButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      byNumberViewStackIndex.value = 1;
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
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
