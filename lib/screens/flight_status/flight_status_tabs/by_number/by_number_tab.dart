import 'package:flutter/material.dart';

import '../../../../util/appcolor.dart';
import 'widgets/by_number_form.dart';

class MyNumberTab extends StatefulWidget {
  const MyNumberTab({super.key});

  @override
  State<MyNumberTab> createState() => _MyNumberTabState();
}

class _MyNumberTabState extends State<MyNumberTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bgCream,
      child: const ByNumberForm(),
    );
  }
}
