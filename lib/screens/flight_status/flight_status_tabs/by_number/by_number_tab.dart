import 'package:flutter/material.dart';
import 'package:frontier_homepage/util/global_variables.dart';

import '../../../../util/appcolor.dart';
import 'widgets/by_number_form.dart';
import 'widgets/by_number_search_result.dart';

class MyNumberTab extends StatefulWidget {
  const MyNumberTab({super.key});

  @override
  State<MyNumberTab> createState() => _MyNumberTabState();
}

class _MyNumberTabState extends State<MyNumberTab> {
  @override
  void dispose() {
    byNumberViewStackIndex.value = 0;
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
        valueListenable: byNumberViewStackIndex,
        builder: (context, index, _) {
          return IndexedStack(
            index: index,
            children: const [
              ByNumberForm(),
              ByNumberSearchResult(),
            ],
          );
        },
      ),
    );
  }
}
