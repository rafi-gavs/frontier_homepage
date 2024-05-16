import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontier_homepage/screens/flight_status/flight_status_tabs/by_cities/widgets/by_cities_bottom_sheet.dart';
import 'package:frontier_homepage/util/app_enums.dart';
import 'package:frontier_homepage/util/app_extensions.dart';
import 'package:frontier_homepage/util/app_functions.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../util/appcolor.dart';
import '../../../../../util/app_date_picker.dart';
import '../../../../../util/global_variables.dart';
import '../../../components/app_button.dart';
import '../../../components/app_text_field.dart';
import '../../../models/airport_model.dart';
import 'by_cities_form_error.dart';

class ByCitiesForm extends StatefulWidget {
  const ByCitiesForm({super.key});

  @override
  State<ByCitiesForm> createState() => _ByCitiesFormState();
}

class _ByCitiesFormState extends State<ByCitiesForm>
    with TickerProviderStateMixin {
  var _selectedDate = DateTime.now();
  final double _kPickerSheetHeight = 216.0;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _departure;
  late TextEditingController _arrival;

  late AnimationController _errorAnimationController;
  late Animation<Offset> _errorAnimation;

  late AnimationController _formAnimationController;
  late Animation<Offset> _formAnimation;

  bool _isError = false;
  bool _showErrorView = false;

  String? _originAirportCode;
  late TextEditingController _flightDate;

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

    _flightDate = TextEditingController(text: _selectedDate.toEEEEMMMMdyyyy());

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _departure.dispose();
    _arrival.dispose();
    _formAnimationController.dispose();
    _errorAnimationController.dispose();
    _flightDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
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
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
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

                            AirportModel? data = await showModalBottomSheet(
                              isScrollControlled: true,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return const ByCitiesBottomSheet(
                                  airportType: AirportType.departure,
                                );
                              },
                            );

                            if (data != null) {
                              _originAirportCode = data.code;
                              _departure.text = AppFunctions.getAirportTitle(
                                code: data.code,
                                cityName: data.cityName,
                                countryCode: data.countryCode,
                              );
                              _arrival.clear();
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
                        IgnorePointer(
                          ignoring: _originAirportCode == null,
                          child: AppTextField(
                            controller: _arrival,
                            readOnly: true,
                            onTap: () async {
                              AirportModel? data = await showModalBottomSheet(
                                isScrollControlled: true,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return ByCitiesBottomSheet(
                                    airportType: AirportType.arrival,
                                    originAirportCode: _originAirportCode,
                                  );
                                },
                              );

                              if (data != null) {
                                _arrival.text = AppFunctions.getAirportTitle(
                                  code: data.code,
                                  cityName: data.cityName,
                                  countryCode: data.countryCode,
                                );
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
                        AppTextField(
                          controller: _flightDate,
                          readOnly: true,
                          onTap: () {
                            AppDatePicker.showDatePicker(
                              context: context,
                              initialDate: _selectedDate,
                              onSelectedDateChanged: (date) {
                                _selectedDate = date;
                                _flightDate.text =
                                    _selectedDate.toEEEEMMMMdyyyy();
                                setState(() {});
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 24.0),
                        AppButton(
                          onPressed: () {
                            if (_isError) {
                              _showErrorView = true;
                              setState(() {
                                _formAnimation = Tween<Offset>(
                                  begin: const Offset(
                                      0.0, -0.4), // Start from bottom
                                  end: const Offset(
                                      0, 0.0), // Move to original position
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
      ),
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.systemGrey3,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
}
