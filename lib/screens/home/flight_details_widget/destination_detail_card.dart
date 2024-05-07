import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/appcolor.dart';


class DestinationDetailCard extends StatelessWidget {
  const DestinationDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Container(
        
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
      ),
        child: Column(
          
          children: [
            Container(
              height: 85,
              width: double.infinity,
              decoration:  BoxDecoration(
                border: Border.all(color:const Color(0xffDFDAC9)),
                borderRadius: const BorderRadius.only(topLeft:Radius.circular(8),topRight: Radius.circular(8)),
                image: const DecorationImage(image:AssetImage('assets/appimage/destinationImage.png',),fit: BoxFit.fill),
              ),
             child:Padding(
               padding: const EdgeInsets.only(left: 10.0,top:40 ),
               child: Text('San Francisco',
               style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColor.whiteColor
               ),),
             ),
              
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                
                    children: [Text('Current time:',style:GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ) ,),
                   const SizedBox(width: 75,),
                    const Icon(Icons.access_time_outlined),
                    const SizedBox(width: 5,),
                    Text('11:37 AM PST',style:GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ) ,)],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text('Current weather:',style:GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,color: AppColor.primary,
                      
                    ) ,), 
                    const SizedBox(width: 45,),
                    const Icon(Icons.sunny,color: Colors.amberAccent,),
                    const SizedBox(width: 5,),
                    Text('75 ̊ ',style:GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      
                    ) ,)],
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
