import 'package:flutter/material.dart';
import 'package:frontier_homepage/screens/flight_status/flight_status_tabs/by_cities/widgets/by_cities_form.dart';

import '../../../../util/appcolor.dart';
import '../../../../util/global_variables.dart';
import 'widgets/by_cities_search_result.dart';

class ByCitiesTab extends StatefulWidget {
  const ByCitiesTab({super.key});

  @override
  State<ByCitiesTab> createState() => _ByCitiesTabState();
}

class _ByCitiesTabState extends State<ByCitiesTab> {
  @override
  void dispose() {
    byCitiesViewStackIndex.value = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bgCream,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: ValueListenableBuilder<int>(
        valueListenable: byCitiesViewStackIndex,
        builder: (context, index, _) {
          return IndexedStack(
            index: index,
            children: const [
              ByCitiesForm(),
              ByCitiesSearchResult(),
            ],
          );
        },
      ),
    );
  }
}
