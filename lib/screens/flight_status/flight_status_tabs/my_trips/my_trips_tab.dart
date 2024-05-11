import 'package:flutter/material.dart';

import '../../../../util/appcolor.dart';
import '../../../../util/global_variables.dart';
import 'widgets/my_trips_empty.dart';
import 'widgets/my_trips_list_details.dart';
import 'widgets/my_trips_list.dart';

class MyTripsTab extends StatefulWidget {
  const MyTripsTab({super.key});

  @override
  State<MyTripsTab> createState() => _MyTripsTabState();
}

class _MyTripsTabState extends State<MyTripsTab> {
  bool isListEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      color: AppColor.bgCream,
      child: Visibility(
        visible: !isListEmpty,
        replacement: const Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: MyTripsEmpty(),
        ),
        //child: const MyTripsListView(),
        child: ValueListenableBuilder(
          valueListenable: myTripsViewStackIndex,
          builder: (context, index, _) {
            return IndexedStack(
              index: index,
              children: const [
                MyTripsList(),
                MyTripsListDetails(),
              ],
            );
          },
        ),
      ),
    );
  }
}
