import 'package:flutter/material.dart';

class ButtonDataProvider with ChangeNotifier {
  bool _isClicked = false;

  //get the private valible
  bool get isClicked => _isClicked;

  //funtion to anminate button like real effects
  void tap(
    PageController controller,
    int index,
    int length,
  ) {
    _isClicked = true;
    Future.delayed(Duration(milliseconds: 200), () {
      _isClicked = false;
      if (index < length - 1) {
        controller.nextPage(
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      }

        notifyListeners();

    });

    notifyListeners();
  }
}
