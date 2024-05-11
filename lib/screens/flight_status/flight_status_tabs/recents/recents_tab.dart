import 'package:flutter/material.dart';
import 'package:frontier_homepage/util/global_variables.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../util/appcolor.dart';
import 'widgets/recents_list.dart';
import 'widgets/recents_searches_view_flights.dart';

class RecentTab extends StatefulWidget {
  const RecentTab({super.key});

  @override
  State<RecentTab> createState() => _RecentTabState();
}

class _RecentTabState extends State<RecentTab> {
  bool isRecentEmpty = false;

  @override
  void dispose() {
    recentsViewStackIndex.value = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      color: AppColor.bgCream,
      child: Visibility(
        visible: !isRecentEmpty,
        replacement: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            'You have no recent searches.',
            style: GoogleFonts.poppins(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: AppColor.stringBlackColor,
            ),
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: recentsViewStackIndex,
          builder: (context, index, _) {
            return IndexedStack(
              index: index,
              children: const [
                RecentsList(),
                RecentsSearchesViewFlights(),
              ],
            );
          },
        ),
      ),
    );
  }
}
