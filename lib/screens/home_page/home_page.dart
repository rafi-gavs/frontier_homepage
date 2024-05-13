import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:frontier_homepage/services/cms_service/sanity_api.dart';
import 'package:frontier_homepage/utils/appcolor.dart';
import 'package:frontier_homepage/utils/global_variables.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/appstring.dart';
import 'components/checking_info_card.dart';
import 'flight_details_widget/destination_detail_card.dart';
import 'flight_details_widget/flight_details_widget.dart';
import 'components/gowild_widget.dart';
import 'components/offercard_widget.dart';
import 'components/recent_search_list.dart';
import 'components/savebig_widget.dart';
import 'components/welcome_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool looding = true;
  String? imageUrl;
  @override
  void initState() {
    apicall();
    WidgetsBinding.instance.addPostFrameCallback((_) async {});

    super.initState();
  }

  final platform = MethodChannel('frontier_flutter_channel');

  Future<void> callNativeMethod() async {
    try {
      await platform.invokeMethod('book_seats_flow_method', {"data": "data"});
    } catch (e) {
      print('Error calling native method: $e');
    }
  }

  apicall() async {
    await ApiServices().fetchData();
    setState(() {
      looding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => await ApiServices().fetchData(),
        child: SingleChildScrollView(
          child: isLoggedIn
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.28,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/appimage/Background.png'),
                                fit: BoxFit.fill),
                          ),
                          child: const WelcomeCard(),
                        ),
                        const OfferCardWidget()
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 30),
                        child: GestureDetector(
                          onTap: () {
                            callNativeMethod();
                          },
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
                      child: looding
                          ? SizedBox()
                          : Container(
                              height: 342,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${cleanedRefValues[2]}'))),
                            ),
                    ),
                    const SaveBigWidget(),
                    const GoWildWidget(),
                    FlightDetailWidget(
                      isCheckedIn: true,
                    ),
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
                    const CheckingInfoCard(
                        addOnText: true,
                        headingText: 'You are Checking Bags!',
                        cardImage: 'assets/appimage/trollybagbrown.png',
                        infoTextFirst: CheckingInfoText(
                            infoText:
                                'Checked bags must be \ndropped off 60 minutes \nbefore your flights scheduled \ndeparture')),
                    const DestinationDetailCard()
                  ],
                )
              : Column(
                  children: [
                    Stack(
                      children: [
                        looding
                            ? SizedBox()
                            : Container(
                                height:
                                    MediaQuery.of(context).size.height * .34,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${cleanedRefValues[2]}'),
                                        fit: BoxFit.fitWidth)),
                              ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 19.0, right: 19.0, top: 250.0),
                            child: ButtonTheme(
                              bordercolor: AppColor.primary,
                              backGroundColor: AppColor.whiteColor,
                              textColor: AppColor.primary,
                              buttonText: AppString.loginOrJoinNow,
                            )),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 19, right: 19),
                      child: ButtonTheme(
                        backGroundColor: AppColor.primary,
                        bordercolor: AppColor.primary,
                        buttonText: AppString.bookAFlight,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 19, right: 19, bottom: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.borderColor)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18.84, left: 15, bottom: 21.14),
                                child: Row(
                                  children: [
                                    Text(
                                      AppString.alreadyBookedYourTrip,
                                      style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.5, bottom: 20, right: 14.5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: BookYourButton(
                                        buttonText: AppString.checkIn,
                                      ),
                                    ),
                                    BookYourButton(
                                      buttonText: AppString.manage,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              AppString.lowfaresToTheBestDestinations,
                              style: GoogleFonts.poppins(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          ListView.custom(
                              scrollDirection: Axis.vertical,
                              childrenDelegate: SliverChildBuilderDelegate(
                                  (context, index) => Container(
                                        width: 20,
                                        height: 20,
                                      )))

                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: ListView.builder(itemBuilder: (context,index){
                          //     return Container();
                          //   }),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

class BookYourButton extends StatelessWidget {
  String buttonText;
  BookYourButton({
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.primary, width: 2)),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 37.5),
          child: Text(buttonText,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColor.primary,
              ))),
    );
  }
}

class ButtonTheme extends StatelessWidget {
  Color bordercolor;
  Color backGroundColor;
  String buttonText;
  Color textColor;

  ButtonTheme({
    this.bordercolor = AppColor.primary,
    required this.backGroundColor,
    required this.buttonText,
    this.textColor = AppColor.whiteColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backGroundColor,
        border: Border.all(color: bordercolor, width: 2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x27000000),
            blurRadius: 19.56,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 0.0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12),
          child: Text(
            buttonText,
            style: GoogleFonts.poppins(
                fontSize: 16.0, fontWeight: FontWeight.w600, color: textColor),
          ),
        ),
      ),
    );
  }
}
