import 'package:flutter/material.dart';
import 'package:frontier_homepage/screens/flight_status/components/search_result_list_item.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/appcolor.dart';
import '../tab_pages/by_cities_tab.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const SizedBox(height: 16.0),
          _resultFoundInfo(),
          const SizedBox(height: 16.0),
          _list(),
        ],
      ),
    );
  }

  Widget _header() {
    return GestureDetector(
      onTap: () {
        byCitiesSearchStackIndex.value = 0;
      },
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back,
            size: 20.0,
          ),
          const SizedBox(width: 8.0),
          Text(
            'Back to search',
            style: GoogleFonts.poppins(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: AppColor.stringBlackColor,
            ),
          )
        ],
      ),
    );
  }

  Widget _resultFoundInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '[3] Flights Found',
          style: GoogleFonts.poppins(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColor.stringBlackColor,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Text(
              'Last refreshed 3/13/24 2:32 PM.',
              style: GoogleFonts.poppins(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: AppColor.stringBlackColor,
              ),
            ),
            const SizedBox(width: 4.0),
            Text(
              'Refresh now.',
              style: GoogleFonts.poppins(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: AppColor.stringBlackColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _list() {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          {
            'flightNumber': 'FLIGHT 2222',
            'badgeOption': 'Arrived',
            'departTime': '8:55 AM',
            'arriveTime': '11:10 AM',
            'departFrom': 'Denver',
            'arriveTo': 'San Diego',
          },
          {
            'flightNumber': 'FLIGHT 3333',
            'badgeOption': 'Arrived',
            'departTime': '8:55 AM',
            'arriveTime': '11:10 AM',
            'departFrom': 'Denver',
            'arriveTo': 'San Diego',
          },
          {
            'flightNumber': 'FLIGHT 4444',
            'badgeOption': 'Arrived',
            'departTime': '8:55 AM',
            'arriveTime': '11:10 AM',
            'departFrom': 'Denver',
            'arriveTo': 'San Diego',
            'connectionFrom': 'LAS',
            'connectionTo': 'SAN',
          },
        ]
            .map(
              (e) => SearchResultListItem(
                flightNumber: e['flightNumber']!,
                badgeOption: e['badgeOption']!,
                departTime: e['departTime']!,
                arriveTime: e['arriveTime']!,
                departFrom: e['departFrom']!,
                arriveTo: e['arriveTo']!,
                connectionFrom: e['connectionFrom'],
                connectionTo: e['connectionTo'],
              ),
            )
            .toList(),
      ),
    );
  }
}
