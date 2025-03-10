import 'package:equatable/equatable.dart';

class VagetableModel extends Equatable {
  final String? name;
  final String? tagline;
  final String? description;
  final List<dynamic>? gradientColor;
  final Map<String,dynamic> nutritions;

  @override
  List<Object?> get props => [
        name,
        tagline,
        description,
        gradientColor,
        nutritions,
      ];

  //constructor
  const VagetableModel({
    required this.description,
    required this.gradientColor,
    required this.name,
    required this.nutritions,
    required this.tagline,
  });

  //from json
  factory VagetableModel.fromJson(Map<String, dynamic> json) {
    return VagetableModel(
      description: json["description"],
      gradientColor: json["gradient_colors"] ,
      name: json["name"],
      nutritions: json["nutrition"],
      tagline: json["tagline"],
    );
  }
}
