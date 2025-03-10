import 'package:flutter/material.dart';

Widget pageIndicator({
  required int length,
  required int currentIndex,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List<Widget>.generate(
      length,
      (index) => Container(
        width: 10,
        height: 10,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index ? Colors.white : Colors.grey.shade600,
        ),
      ),
    ),
  );
}
