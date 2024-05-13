import 'package:flutter/material.dart';
import 'package:frontier_homepage/screens/flight_status/flight_status_tabs/by_cities/widgets/by_cities_bottom_sheet.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../util/appcolor.dart';
import '../../../../../util/global_variables.dart';
import '../../../components/app_button.dart';
import '../../../components/app_text_field.dart';
import 'by_cities_form_error.dart';

class ByCitiesForm extends StatefulWidget {
  const ByCitiesForm({super.key});

  @override
  State<ByCitiesForm> createState() => _ByCitiesFormState();
}

class _ByCitiesFormState extends State<ByCitiesForm> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _departure;
  late TextEditingController _arrival;

  late AnimationController _errorAnimationController;
  late Animation<Offset> _errorAnimation;

  late AnimationController _formAnimationController;
  late Animation<Offset> _formAnimation;

  bool _isError = true;
  bool _showErrorView = false;

  @override
  void initState() {
    // TODO: implement initState
    _departure = TextEditingController(text: '');
    _arrival = TextEditingController(text: '');

    _errorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Adjust duration as needed
    );

    _errorAnimation = Tween<Offset>(
      begin: const Offset(0.0, 5.0), // Start from bottom
      end: Offset.zero, // Move to original position
    ).animate(CurvedAnimation(
      parent: _errorAnimationController,
      curve: Curves.easeInOut,
    ));

    _formAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600), // Adjust duration as needed
    );

    _formAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0), // Start from bottom
      end: const Offset(0, 0.0), // Move to original position
    ).animate(CurvedAnimation(
      parent: _formAnimationController,
      curve: Curves.easeInOut,
    ));

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _departure.dispose();
    _arrival.dispose();
    _formAnimationController.dispose();
    _errorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              border: Border.all(
                color: const Color(0xffDFDAC9),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: _isError && _showErrorView,
                  child: SlideTransition(
                    position: _errorAnimation,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: ByCitiesFormError(),
                    ),
                  ),
                ),
                SlideTransition(
                  position: _formAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Departure',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.stringBlackColor,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      AppTextField(
                        controller: _departure,
                        readOnly: true,
                        onTap: () async {
                          //fsScaffoldKey.currentState!.openDrawer();

                          var data = await showModalBottomSheet(
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return const ByCitiesBottomSheet();
                            },
                          );

                          if (data != null) {
                            _departure.text = data;
                            setState(() {});
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Departure airport is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Arrival',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.stringBlackColor,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      AppTextField(
                        controller: _arrival,
                        readOnly: true,
                        onTap: () async {
                          var data = await showModalBottomSheet(
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return const ByCitiesBottomSheet();
                            },
                          );

                          if (data != null) {
                            _arrival.text = data;
                            setState(() {});
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Arrival airport is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Flight Date',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.stringBlackColor,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      const AppTextField(
                        initialValue: 'Friday, April 5th, 2024',
                        readOnly: true,
                      ),
                      const SizedBox(height: 24.0),
                      AppButton(
                        onPressed: () {
                          if (_isError) {
                            _showErrorView = true;
                            setState(() {
                              _formAnimation = Tween<Offset>(
                                begin: const Offset(0.0, -0.4), // Start from bottom
                                end: const Offset(0, 0.0), // Move to original position
                              ).animate(CurvedAnimation(
                                parent: _formAnimationController,
                                curve: Curves.easeInOut,
                              ));

                              _formAnimationController.forward();

                              _errorAnimationController.forward();
                            });
                          } else {
                            if (_formKey.currentState!.validate()) {
                              byCitiesViewStackIndex.value = 1;
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
