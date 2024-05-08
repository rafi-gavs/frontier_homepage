import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/appcolor.dart';
import '../components/recent_list_item.dart';

class RecentsTab extends StatefulWidget {
  const RecentsTab({super.key});

  @override
  State<RecentsTab> createState() => _RecentsTabState();
}

class _RecentsTabState extends State<RecentsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RecentListItem(),
            const RecentListItem(
              number: 'F9 4444',
            ),
            _clear(),
          ],
        ),
      ),
    );
  }

  Widget _clear() {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: Text(
        'Clear Searches',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColor.linkText,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
