import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CheckingInfoCard extends StatelessWidget {
  final String headingText;
  final String cardImage;
  final Widget infoTextFirst;
  final Widget? infoTextSecond;
  final bool addOnText;

  const CheckingInfoCard(
      {super.key,
      required this.headingText,
      required this.cardImage,
      required this.infoTextFirst,
      this.infoTextSecond = const SizedBox(),
      this.addOnText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color:Color(0xffDFDAC9)),
            // boxShadow: const[
            //             BoxShadow(
            //               color: Color(0xffDFDAC9),
            //               blurRadius: 19.56,
            //               blurStyle: BlurStyle.outer,
            //               offset: Offset(0, 0.0),
            //               spreadRadius: 0,
            //             ),
            //           ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 17, bottom: 12),
              child: Row(
                children: [
                  Text(
                    headingText,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            if (addOnText)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Keep in Mind:',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
            
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22),
                        child: SizedBox(
                            child: Image.asset(
                          cardImage,
                          fit: BoxFit.contain,
                        )),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      infoTextFirst,
                      const SizedBox(
                        height: 10,
                      ),
                      infoTextSecond!
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CheckingInfoText extends StatelessWidget {
  final String infoText;
  const CheckingInfoText({
    super.key,
    required this.infoText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.black),
          ),
        ),
        Text(
          infoText,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
