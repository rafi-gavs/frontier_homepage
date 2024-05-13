import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/appcolor.dart';

class AppTextField extends StatefulWidget {
  final String? initialValue;
  final void Function()? onTap;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const AppTextField({
    super.key,
    this.initialValue,
    this.onTap,
    this.readOnly = false,
    this.validator,
    this.controller,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      cursorWidth: 1.0,
      cursorColor: AppColor.textFieldBorder,
      controller: widget.controller,
      validator: widget.validator,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColor.stringBlackColor,
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        isCollapsed: true,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 6.0,
        ),
        errorStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColor.inputFieldError,
        ),
        filled: false,
        suffixIconConstraints: const BoxConstraints(
          minHeight: 16.0,
          minWidth: 16.0,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Image.asset(
            'assets/appimage/arrow_down.png',
            height: 16.0,
            width: 16.0,
          ),
        ),
      ),
    );
  }
}
