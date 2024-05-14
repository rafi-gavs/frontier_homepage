import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../util/appcolor.dart';

class ByCitiesBottomSheet extends StatefulWidget {
  const ByCitiesBottomSheet({super.key});

  @override
  State<ByCitiesBottomSheet> createState() => _ByCitiesBottomSheetState();
}

class _ByCitiesBottomSheetState extends State<ByCitiesBottomSheet> {
  final ValueNotifier<int> _searchResultViewIndex = ValueNotifier(0);

  List<String> _searchResultList = [];

  final List<String> _allAirportList = [
    'Atlanta, GA (ATL)',
    'Austin, TX (AUS)',
    'Baltimore, MD (BWI)',
    'Bentonville, AR (XNA)',
    'Bloomington, IL (BMI)',
    'Boston, MA (BOS)',
    'Buffalo, NY (BUE)',
    'Cedar Rapids, IA (CID)',
    'Charleston, SC (CHS)',
    'Charlotte, NC (CLT)',
    'Chicago (Midway), IL (MDW)',
    'Chicago (O’Hare), IL (ORD)'
  ];

  @override
  void dispose() {
    _searchResultViewIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _closeButton(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _searchBar(),
                ValueListenableBuilder<int>(
                  valueListenable: _searchResultViewIndex,
                  builder: (context, index, _) {
                    return IndexedStack(
                      index: index,
                      children: [
                        //initial views
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _recentSection(),
                            const SizedBox(height: 12.0),
                            _allAirportsSection(),
                          ],
                        ),

                        //search results
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _searchResultList.map((e) => _listItem(e)).toList(),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _closeButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: AppColor.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.clear_rounded,
              size: 32.0,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFF767680).withOpacity(0.12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8.0),
          Image.asset(
            fit: BoxFit.contain,
            'assets/appimage/search.png',
            height: 15,
            width: 15,
          ),
          Expanded(
            child: TextField(
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.stringBlackColor,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                filled: false,
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  _searchResultList.clear();
                  _searchResultViewIndex.value = 0;
                } else {
                  _searchResultList.clear();
                  _searchResultList = _allAirportList.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
                  if (_searchResultList.isNotEmpty) {
                    _searchResultViewIndex.value = 1;
                  }
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 5.0,
      ),
      width: double.infinity,
      color: AppColor.bgCream,
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: AppColor.fontSecondary,
        ),
      ),
    );
  }

  Widget _recentSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _header('Recent'),
        const SizedBox(height: 12.0),
        ListView(
          primary: false,
          shrinkWrap: true,
          children: ['Denver, CO (DEN)', 'San Diego, CA (SAN)'].map((e) => _listItem(e)).toList(),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Image.asset(
                height: 20.0,
                width: 20.0,
                'assets/appimage/location.png',
              ),
              const SizedBox(width: 10.0),
              Text(
                'Current Location',
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: AppColor.stringBlackColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _allAirportsSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _header('All Airports'),
        const SizedBox(height: 12.0),
        ListView(
          primary: false,
          shrinkWrap: true,
          children: _allAirportList.map((e) => _listItem(e)).toList(),
        ),
      ],
    );
  }

  Widget _listItem(String value) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, value);
      },
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: AppColor.stringBlackColor,
              ),
            ),
            const SizedBox(height: 12.0),
            Container(
              width: double.infinity,
              height: 1.0,
              color: AppColor.borderColor,
            ),
          ],
        ),
      ),
    );
  }
}
