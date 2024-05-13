import 'package:flutter/material.dart';
import 'package:frontier_homepage/utils/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatefulWidget {
  final void Function()? onPressed;
  const AppButton({
    super.key,
    this.onPressed,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48.0),
        backgroundColor: AppColor.btBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      child: Text(
        'Search',
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
