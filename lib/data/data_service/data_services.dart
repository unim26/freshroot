import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freshroot/model/vagetable_model.dart';

class DataServices {
  //get vegetable data method
  Future<List<VagetableModel>> getVegetableData() async {
    final String response =
        await rootBundle.loadString("assets/vegetable_data.json");

    final List<dynamic> data = jsonDecode(response);

    return data.map((vegi) => VagetableModel.fromJson(vegi)).toList();
  }

  //onboarding data list
  List onBoardingData = [
    //1st page
    [
      "Discover Fresh & Nutritious Vegetables",
      "Learn about different vegetables, their benefits, and how they can improve your health.",
      "assets/images/onBoardImage1.png",
      [Colors.green, Colors.lightGreenAccent],
    ],
    //2nd page
    [
      "Know What You Eat",
      "Get nutritional facts, health benefits, and interesting facts about every vegetable.",
      "assets/images/onBoardImage2.png",
      [Colors.orange, Colors.yellow],
    ],
    //3rd page
    [
      "Find Any Vegetable Instantly",
      "Use our easy search feature to quickly find any vegetable and learn everything about it.",
      "assets/images/onBoardImage3.png",
      [Colors.blueAccent, Colors.greenAccent],
    ],
  ];
}
