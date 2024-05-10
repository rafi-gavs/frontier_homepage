import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/appcolor.dart';

class AppTextField extends StatefulWidget {
  final String? initialValue;
  final void Function()? onTap;
  final bool readOnly;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    this.initialValue,
    this.onTap,
    this.readOnly = false,
    this.validator,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: AppColor.textFieldBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              cursorWidth: 1.0,
              cursorColor: AppColor.textFieldBorder,
              controller: TextEditingController(text: widget.initialValue),
              validator: widget.validator,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.stringBlackColor,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 6.0,
                ),
                filled: false,
              ),
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: AppColor.btBg,
          ),
          const SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
