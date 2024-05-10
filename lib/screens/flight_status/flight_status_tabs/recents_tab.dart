import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/appcolor.dart';
import '../components/recent_list_item.dart';
import '../components/search_results.dart';

class RecentTab extends StatefulWidget {
  const RecentTab({super.key});

  @override
  State<RecentTab> createState() => _RecentTabState();
}

class _RecentTabState extends State<RecentTab> {
  ///Created [ValueNotifier] variable [recentStackIndex] in [RecentTab] to show result widget based on [IndexedStack] index
  ValueNotifier<int> recentStackIndex = ValueNotifier(0);

  @override
  void dispose() {
    recentStackIndex.value = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bgCream,
      child: ValueListenableBuilder<int>(
        valueListenable: recentStackIndex,
        builder: (context, index, _) {
          return IndexedStack(
            index: index,
            children: [
              _recentSearchesView(),
              SearchResults(
                headerTitle: 'DEN to SAN',
                onBackTap: () {
                  recentStackIndex.value = 0;
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _recentSearchesView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecentListItem(
            date: 'April 5th, 2024',
            onViewFlightTap: () {
              recentStackIndex.value = 1;
            },
          ),
          RecentListItem(
            date: 'April 4th, 2024',
            number: 'F9 4444',
            onViewFlightTap: () {
              recentStackIndex.value = 1;
            },
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
