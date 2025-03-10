import 'package:flutter/material.dart';
import 'package:freshroot/data/data_service/data_services.dart';
import 'package:freshroot/pages/home_page.dart';
import 'package:freshroot/providers/button_data_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Widget myButton({
  required BuildContext context,
  required double sHeight,
  required double sWidth,
  required String text,
  required int currentIndex,
  required PageController controller,
}) {
  final DataServices dataServices = DataServices();
  return GestureDetector(
    onTap: () {
      if (currentIndex == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
      context.read<ButtonDataProvider>().tap(
            controller,
            currentIndex,
            dataServices.onBoardingData.length,
          );
    },
    child: AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: sWidth * .4,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        color: context.watch<ButtonDataProvider>().isClicked
            ? dataServices.onBoardingData[currentIndex][3][1]
            : dataServices.onBoardingData[currentIndex][3][0],
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: dataServices.onBoardingData[0][3][0],
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontFamily: GoogleFonts.josefinSans().fontFamily,
              ),
        ),
      ),
    ),
  );
}
