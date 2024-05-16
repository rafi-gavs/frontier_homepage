import 'package:flutter/material.dart';
import 'package:frontier_homepage/screens/flight_status/models/airport_model.dart';
import 'package:frontier_homepage/screens/flight_status/viewmodels/airport_list_vm.dart';
import 'package:frontier_homepage/util/app_functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../core/di/di.dart';
import '../../../../../util/app_enums.dart';
import '../../../../../util/appcolor.dart';

class ByCitiesBottomSheet extends StatefulWidget {
  final AirportType airportType;
  final String? originAirportCode;

  const ByCitiesBottomSheet({
    super.key,
    required this.airportType,
    this.originAirportCode,
  });

  @override
  State<ByCitiesBottomSheet> createState() => _ByCitiesBottomSheetState();
}

class _ByCitiesBottomSheetState extends State<ByCitiesBottomSheet> {
  final ValueNotifier<int> _searchResultViewIndex = ValueNotifier(0);

  late BuildContext _airportVMContext;

  List<AirportModel> _searchResultList = [];

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

  List<AirportModel> _getSearchResult(
    List<AirportModel> list,
    String key,
  ) {
    var resultList = list
        .where((e) =>
            e.code.toLowerCase().contains(key.toLowerCase()) ||
            e.cityName.toLowerCase().contains(key.toLowerCase()) ||
            e.provinceOrStateName.toLowerCase().contains(key.toLowerCase()) ||
            e.countryName.toLowerCase().contains(key.toLowerCase()) ||
            e.stateName.toLowerCase().contains(key.toLowerCase()) ||
            e.countryCode.toLowerCase().contains(key.toLowerCase()))
        .toList();

    return resultList;
  }

  @override
  void dispose() {
    _searchResultViewIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AirportListVM>(
      create: widget.airportType == AirportType.departure
          ? (context) => getIt()..getOriginAirportList()
          : (context) => getIt()
            ..getDestinationAirportList(
              originAirport: widget.originAirportCode!,
            ),
      child: Builder(builder: (context) {
        _airportVMContext = context;
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
                              children: _searchResultList
                                  .map((e) => _airportListItem(e))
                                  .toList(),
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
      }),
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
    var list = _airportVMContext.watch<AirportListVM>().airportList;
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
                  _searchResultList = _getSearchResult(list, value);
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
          children: ['Denver, CO (DEN)', 'San Diego, CA (SAN)']
              .map((e) => _listItem(e))
              .toList(),
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
        Builder(builder: (context) {
          var vm = context.watch<AirportListVM>();
          var list = vm.airportList;
          if (vm.isLoading) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: const Center(
                child: SizedBox(
                  height: 16,
                  width: 16.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
                  ),
                ),
              ),
            );
          }

          if (!vm.isLoading) {
            return ListView(
              primary: false,
              shrinkWrap: true,
              children: list.map((e) => _airportListItem(e)).toList(),
            );
          }

          if (vm.error != null) {
            return Text(vm.error!);
          }

          return const SizedBox();
        }),
      ],
    );
  }

  Widget _airportListItem(AirportModel originAirportModel) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, originAirportModel);
      },
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppFunctions.getAirportTitle(
                code: originAirportModel.code,
                cityName: originAirportModel.cityName,
                countryCode: originAirportModel.countryCode,
              ),
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

  Widget _listItem(String value) {
    return GestureDetector(
      onTap: () {
        //Navigator.pop(context, value);
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
