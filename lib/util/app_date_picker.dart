import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppDatePicker {
  static showDatePicker({
    required BuildContext context,
    required DateTime initialDate,
    required void Function(DateTime)? onSelectedDateChanged,
  }) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          color: CupertinoColors.systemGrey3,
          width: double.infinity,
          height: 220.0,
          child: CupertinoPicker(
            itemExtent: 40,
            onSelectedItemChanged: (index) {
              switch (index) {
                case 0:
                  var selectedDate = initialDate.subtract(const Duration(days: 1));
                  onSelectedDateChanged!(selectedDate);
                  break;
                case 1:
                  var selectedDate = initialDate;
                  onSelectedDateChanged!(selectedDate);
                  break;
                case 2:
                  var selectedDate = initialDate.add(const Duration(days: 1));
                  onSelectedDateChanged!(selectedDate);
                  break;
              }
            },
            scrollController: FixedExtentScrollController(
              initialItem: 1,
            ),
            children: [
              _textWidget(_formatDate(initialDate.subtract(const Duration(days: 1)))),
              _textWidget(_formatDate(initialDate)),
              _textWidget(_formatDate(initialDate.add(const Duration(days: 1)))),
            ],
          ),
        );
      },
    );
  }

  static String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE, MMMM d, yyyy');
    final String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static _textWidget(String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        value,
        style: GoogleFonts.poppins(
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
