import 'package:flutter/material.dart';

import '../../../../../routes.dart';
import '../../../../../util/global_variables.dart';
import '../../../components/search_result_header.dart';
import '../../../components/search_result_list_item.dart';

class RecentsSearchesViewFlights extends StatefulWidget {
  const RecentsSearchesViewFlights({super.key});

  @override
  State<RecentsSearchesViewFlights> createState() => _RecentsSearchesViewFlightsState();
}

class _RecentsSearchesViewFlightsState extends State<RecentsSearchesViewFlights> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24.0),
        SearchResultHeader(
          title: 'DEN to SAN',
          lastRefreshedDate: '3/13/24 2:32 PM',
          onBackTap: () {
            recentsViewStackIndex.value = 0;
          },
          onRefreshTap: () {},
        ),
        const SizedBox(height: 16.0),
        _list(),
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
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SearchResultListItem(
                  flightNumber: e['flightNumber']!,
                  badgeOption: e['badgeOption']!,
                  departTime: e['departTime']!,
                  arriveTime: e['arriveTime']!,
                  departFrom: e['departFrom']!,
                  arriveTo: e['arriveTo']!,
                  connectionFrom: e['connectionFrom'],
                  connectionTo: e['connectionTo'],
                  onTap: () {
                    Navigator.pushNamed(context, Routes.flightStatusIndividualResult);
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
