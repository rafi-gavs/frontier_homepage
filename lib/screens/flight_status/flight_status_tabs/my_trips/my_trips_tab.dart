import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../util/appcolor.dart';
import '../../../../util/global_variables.dart';
import '../../components/app_button.dart';
import '../../components/app_text_field.dart';
import 'widgets/my_trips_empty_view.dart';
import '../../flight_status_page.dart';

class MyTripsTab extends StatefulWidget {
  const MyTripsTab({super.key});

  @override
  State<MyTripsTab> createState() => _MyTripsTabState();
}

class _MyTripsTabState extends State<MyTripsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      color: AppColor.bgCream,
      //child: _form(),
      child: Visibility(
        visible: isLoggedIn,
        replacement: const MyTripsEmptyView(),
        child: const SizedBox(),
      ),
    );
  }
}
