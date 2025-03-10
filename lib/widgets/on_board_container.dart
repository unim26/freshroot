import 'package:flutter/material.dart';
import 'package:freshroot/data/data_service/data_services.dart';
import 'package:freshroot/widgets/my_button.dart';
import 'package:freshroot/widgets/page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

Widget onBoardContainer({
  required BuildContext context,
  required double sHeight,
  required double sWidth,
  required int currentIndex,
  required PageController controller,
}) {
  final DataServices dataServices = DataServices();
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //space
        Spacer(),
        //image
        Image.asset(
          dataServices.onBoardingData[currentIndex][2],
          height: sHeight * .3,
          fit: BoxFit.cover,
        ),

        //space
        Spacer(),
        //titile
        Text(
          dataServices.onBoardingData[currentIndex][0],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontFamily: GoogleFonts.josefinSans().fontFamily,
            shadows: [
              Shadow(
                  color: dataServices.onBoardingData[0][3][1],
                  blurRadius: 4,
                  offset: Offset(1, 1))
            ],
          ),
        ),

        //space
        Spacer(),

        //tag line
        Text(
          dataServices.onBoardingData[currentIndex][1],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontFamily: GoogleFonts.josefinSans().fontFamily,
            shadows: [
              Shadow(
                color: dataServices.onBoardingData[currentIndex][3][1],
                blurRadius: 4,
                offset: Offset(1, 1),
              )
            ],
          ),
        ),

        //space
        Spacer(),

        //page indicater
        pageIndicator(
          length: dataServices.onBoardingData.length,
          currentIndex: currentIndex,
        ),

        //space
        Spacer(),

        //next  or continue button
        myButton(
          context: context,
          controller: controller,
          currentIndex: currentIndex,
          sHeight: sHeight,
          sWidth: sWidth,
          text: currentIndex == 2 ? "Get Started" : "Next",
        ),

        //space
        Spacer(),
      ],
    ),
  );
}
