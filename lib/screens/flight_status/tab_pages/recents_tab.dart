import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/appcolor.dart';
import '../components/recent_list_item.dart';

class RecentTab extends StatefulWidget {
  const RecentTab({super.key});

  @override
  State<RecentTab> createState() => _RecentTabState();
}

class _RecentTabState extends State<RecentTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RecentListItem(
            date: 'April 5th, 2024',
          ),
          const RecentListItem(
            date: 'April 4th, 2024',
            number: 'F9 4444',
          ),
          _clear(),
        ],
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
