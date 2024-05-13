import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/appcolor.dart';
import '../../../../../utils/global_variables.dart';
import '../../../components/details_header.dart';
import '../../../components/search_result_list_item.dart';

class MyTripsListDetails extends StatefulWidget {
  const MyTripsListDetails({super.key});

  @override
  State<MyTripsListDetails> createState() => _MyTripsListDetailsState();
}

class _MyTripsListDetailsState extends State<MyTripsListDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24.0),
        DetailsHeader(
          onBackTap: () {
            myTripsViewStackIndex.value = 0;
          },
          title: 'SAN to AUS',
        ),
        const SizedBox(height: 24.0),
        detailView(),
      ],
    );
  }

  Widget detailView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchResultListItem(
          flightNumber: 'FLIGHT 2222',
          badgeOption: 'Arrived',
          departTime: '8:55 AM',
          arriveTime: '11:10 AM',
          departFrom: 'San Diego',
          arriveTo: 'Denver',
        ),
        const SizedBox(height: 24.0),
        Text(
          '2 hour 34 minute connection in DEN',
          style: GoogleFonts.poppins(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColor.stringBlackColor,
          ),
        ),
        const SizedBox(height: 24.0),
        const SearchResultListItem(
          flightNumber: 'FLIGHT 4444',
          badgeOption: 'On Time',
          departTime: '11:11 AM',
          arriveTime: '2:22 PM',
          departFrom: 'Denver',
          arriveTo: 'Austin',
        ),
      ],
    );
  }
}
