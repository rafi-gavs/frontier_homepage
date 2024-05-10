import 'package:flutter/material.dart';
import 'package:frontier_homepage/util/appstring.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/appcolor.dart';
import 'components/fs_drawer.dart';
import 'flight_status_tabs/by_cities/by_cities_tab.dart';
import 'flight_status_tabs/by_number_tab.dart';
import 'flight_status_tabs/my_trips/my_trips_tab.dart';
import 'flight_status_tabs/recents_tab.dart';

final GlobalKey<ScaffoldState> fsScaffoldKey = GlobalKey();

class FlightStatusPage extends StatefulWidget {
  const FlightStatusPage({super.key});

  @override
  State<FlightStatusPage> createState() => _FlightStatusPageState();
}

class _FlightStatusPageState extends State<FlightStatusPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTab = 1;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(vsync: this, length: 4);
    _tabListener();
    super.initState();
  }

  _tabListener() {
    _tabController.animation?.addListener(() {
      var value = (_tabController.animation?.value)!.round();
      if (value != _currentTab) {
        _currentTab = value;
        setState(() {});
      }
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
      key: fsScaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: const FSDrawer(),
      backgroundColor: AppColor.bgCream,
      body: Column(
        children: [
          const SizedBox(height: 8.0),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
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
                          vertical: 8.0,
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
                    ByCitiesTab(),
                    MyNumberTab(),
                    RecentTab(),
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
