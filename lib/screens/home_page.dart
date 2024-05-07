import 'package:flutter/material.dart';
import 'package:frontier_homepage/util/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/appstring.dart';
import '../common_widgets/bottom_navbar.dart';
import 'home/components/checking_info_card.dart';
import 'home/flight_details_widget/destination_detail_card.dart';
import 'home/flight_details_widget/flight_details_widget.dart';
import 'home/components/gowild_widget.dart';
import 'home/components/offercard_widget.dart';
import 'home/components/recent_search_list.dart';
import 'home/components/savebig_widget.dart';
import 'home/components/welcome_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColor.primary
          ),

        ) 
      ),
      body: GestureDetector(
        onTap: () {},
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/appimage/Background.png'),
                          fit: BoxFit.fill),
                    ),
                    child: const WelcomeCard(),
                  ),
                  const OfferCardWidget()
                ],
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 30),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x27000000),
                          blurRadius: 19.56,
                          blurStyle: BlurStyle.outer,
                          offset: Offset(0, 0.0),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    height: 61,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        AppString.bookAFlight,
                        style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('Recent Searches',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: AppColor.stringBlackColor)),
              ),
              const SizedBox(
                height: 10,
              ),
              const RecentSearchList(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 342,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/appimage/bau_offer.png'))),
                ),
              ),
              const SaveBigWidget(),
              const GoWildWidget(),
              FlightDetailWidget(
                isCheckedIn: true,
              ),
              const WelcomeCard(),
              const CheckingInfoCard(
                headingText:
                    "You are Bringing a Personal Item \nand/or a Carry-On",
                cardImage: 'assets/appimage/trollybagblue.png',
                infoTextFirst: CheckingInfoText(
                    infoText:
                        'Proceed to security and \nstraight to your gate'),
                infoTextSecond: CheckingInfoText(
                    infoText:
                        "Personal items and carry- \nons are subject to size check\nat the gate"),
              ),
              const CheckingInfoCard(addOnText: true,
                  headingText: 'You are Checking Bags!',
                  cardImage: 'assets/appimage/trollybagbrown.png',
                  infoTextFirst: CheckingInfoText(
                      infoText:
                          'Checked bags must be \ndropped off 60 minutes \nbefore your flights scheduled \ndeparture')),
                          const DestinationDetailCard()
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
