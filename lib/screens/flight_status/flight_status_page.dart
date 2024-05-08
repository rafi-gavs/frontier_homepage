import 'package:flutter/material.dart';
import 'package:frontier_homepage/screens/flight_status/tab_pages/by_number_tab.dart';
import 'package:frontier_homepage/screens/flight_status/tab_pages/my_cities_tab.dart';
import 'package:frontier_homepage/screens/flight_status/tab_pages/my_trips_tab.dart';
import 'package:frontier_homepage/screens/flight_status/tab_pages/recents_tab.dart';
import 'package:frontier_homepage/util/appstring.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/appcolor.dart';

class FlightStatusPage extends StatefulWidget {
  const FlightStatusPage({super.key});

  @override
  State<FlightStatusPage> createState() => _FlightStatusPageState();
}

class _FlightStatusPageState extends State<FlightStatusPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(vsync: this, length: 4);
    _tabListener();
    super.initState();
  }

  _tabListener() {
    _tabController.addListener(() {
      setState(() {
        _currentTab = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgCream,
      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Scaffold(
                backgroundColor: AppColor.bgCream,
                appBar: AppBar(
                  backgroundColor: AppColor.bgCream,
                  bottom: PreferredSize(
                    preferredSize: const Size(double.infinity, 48.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: AppColor.tabBarColor,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        controller: _tabController,
                        indicatorColor: Colors.transparent,
                        labelPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        tabs: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                            decoration: BoxDecoration(
                              color: _currentTab == 0 ? Colors.white : Colors.transparent,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              'My Trips',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: _currentTab == 0 ? FontWeight.w600 : FontWeight.w500,
                                color: AppColor.stringBlackColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                            decoration: BoxDecoration(
                              color: _currentTab == 1 ? Colors.white : Colors.transparent,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              'By Cities',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: _currentTab == 1 ? FontWeight.w600 : FontWeight.w500,
                                color: AppColor.stringBlackColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                            decoration: BoxDecoration(
                              color: _currentTab == 2 ? Colors.white : Colors.transparent,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              'By Number',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: _currentTab == 2 ? FontWeight.w600 : FontWeight.w500,
                                color: AppColor.stringBlackColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                            decoration: BoxDecoration(
                              color: _currentTab == 3 ? Colors.white : Colors.transparent,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              'Recents',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: _currentTab == 3 ? FontWeight.w600 : FontWeight.w500,
                                color: AppColor.stringBlackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  title: Text(
                    AppString.checkFlightStatus,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primary,
                    ),
                  ),
                ),
                body: TabBarView(
                  controller: _tabController,
                  children: const [
                    MyTripsTab(),
                    MyCitiesTab(),
                    MyNumberTab(),
                    RecentsTab(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}