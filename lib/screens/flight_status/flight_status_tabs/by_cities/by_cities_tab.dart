import 'package:flutter/material.dart';
import 'package:frontier_homepage/screens/flight_status/flight_status_tabs/by_cities/widgets/by_cities_form.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../util/appcolor.dart';
import '../../../../util/global_variables.dart';
import '../../components/app_button.dart';
import '../../components/app_text_field.dart';
import 'widgets/by_cities_form_error_view.dart';
import '../../components/search_results.dart';
import '../../flight_status_page.dart';

class ByCitiesTab extends StatefulWidget {
  const ByCitiesTab({super.key});

  @override
  State<ByCitiesTab> createState() => _ByCitiesTabState();
}

class _ByCitiesTabState extends State<ByCitiesTab> {
  @override
  void dispose() {
    byCitiesSearchStackIndex.value = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bgCream,
      child: ValueListenableBuilder<int>(
        valueListenable: byCitiesSearchStackIndex,
        builder: (context, index, _) {
          return IndexedStack(
            index: index,
            children: [
              const ByCitiesForm(),
              SearchResults(
                headerTitle: 'Back to search',
                onBackTap: () {
                  byCitiesSearchStackIndex.value = 0;
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
