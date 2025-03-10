import 'package:flutter/material.dart';
import 'package:freshroot/model/vagetable_model.dart';
import 'package:google_fonts/google_fonts.dart';

Widget nutritionDetailWidget(
    {required BuildContext context, required VagetableModel vegetable}) {
  final List<String> nutrients = ["calories", "carbs", "fiber", "protein"];

  return Card(
    elevation: 5.0,
    margin: EdgeInsets.zero,
    child: ExpansionTile(
      title: Text(
        "Nutrition value per 100g",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontFamily: GoogleFonts.josefinSans().fontFamily,
            ),
      ),
      children: nutrients
          .map((nutrient) => Column(
                children: [
                  Divider(
                    height: 2.0,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      color: Color(int.parse(vegetable.gradientColor![0])),
                    ),
                    title: Text(
                      nutrient,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(int.parse(vegetable.gradientColor![0])),
                      ),
                    ),
                    trailing: Text(
                      vegetable.nutritions[nutrient].toString() +
                          (nutrient == "calories" ? " kcal" : " g"),
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(int.parse(vegetable.gradientColor![0])),
                      ),
                    ),
                  )
                ],
              ))
          .toList(),
    ),
  );
}
