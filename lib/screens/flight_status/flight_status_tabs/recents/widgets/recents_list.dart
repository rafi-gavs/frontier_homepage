import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/appcolor.dart';
import '../../../../../utils/global_variables.dart';
import 'recent_list_item.dart';

class RecentsList extends StatefulWidget {
  const RecentsList({super.key});

  @override
  State<RecentsList> createState() => _RecentsListState();
}

class _RecentsListState extends State<RecentsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        _list(),
        _clearButton(),
      ],
    );
  }

  Widget _list() {
    return SingleChildScrollView(
      child: Column(
        children: [
          {
            'date': 'April 5th, 2024',
          },
          {
            'date': 'April 4th, 2024',
            'number': 'F9 4444',
          },
        ]
            .map(
              (e) => RecentListItem(
                date: e['date']!,
                number: e['number'],
                onViewFlightTap: () {
                  recentsViewStackIndex.value = 1;
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _clearButton() {
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
