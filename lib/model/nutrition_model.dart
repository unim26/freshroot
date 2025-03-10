import 'package:equatable/equatable.dart';

class NutritionModel extends Equatable {
  final int? calories;
  final int? carbs;
  final int? fiber;
  final int? protein;

  @override
  List<Object?> get props => [
        calories,
        carbs,
        fiber,
        protein,
      ];

  const NutritionModel({
    required this.calories,
    required this.carbs,
    required this.fiber,
    required this.protein,
  });

  //from json
  factory NutritionModel.fromJson(Map<String, dynamic> json) {
    return NutritionModel(
      calories: json["calories"],
      carbs: json["carbs"],
      fiber: json["fiber"],
      protein: json["protein"],
    );
  }
}
