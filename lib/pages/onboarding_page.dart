import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:freshroot/data/data_service/data_services.dart';
import 'package:freshroot/widgets/on_board_container.dart';

class OnboardingPage extends StatefulWidget {
 const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final DataServices _dataServices = DataServices();

  int currentIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final double sHeight = MediaQuery.sizeOf(context).height;
    final double sWidth = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        //body
        body: Center(
          //info
          child: Container(
            width: sWidth * .9,
            height: sHeight * .9,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _dataServices.onBoardingData[currentIndex][3][0],
                  _dataServices.onBoardingData[currentIndex][3][1],
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: _dataServices.onBoardingData[currentIndex][3][0],
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(1, 3),
                ),
              ],
            ),
            child: PageView.builder(
              controller: _controller,
              dragStartBehavior: DragStartBehavior.down,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: _dataServices.onBoardingData.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => onBoardContainer(
                currentIndex: currentIndex,
                context: context,
                controller: _controller,
                sHeight: sHeight,
                sWidth: sWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
