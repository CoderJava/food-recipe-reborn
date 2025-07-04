import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_response.g.dart';

@JsonSerializable()
class MealResponse extends Equatable {
  @JsonKey(name: 'meals')
  final List<ItemMealResponse>? meals;

  const MealResponse({required this.meals});

  factory MealResponse.fromJson(Map<String, dynamic> json) => _$MealResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealResponseToJson(this);

  @override
  List<Object?> get props => [
        meals,
      ];

  @override
  String toString() {
    return 'MealResponse{meals: $meals}';
  }
}

@JsonSerializable()
class ItemMealResponse extends Equatable {
  @JsonKey(name: 'idMeal')
  final String? idMeal;

  @JsonKey(name: 'strMeal')
  final String? strMeal;

  @JsonKey(name: 'strMealAlternate')
  final String? strMealAlternate;

  @JsonKey(name: 'strCategory')
  final String? strCategory;

  @JsonKey(name: 'strArea')
  final String? strArea;

  @JsonKey(name: 'strInstructions')
  final String? strInstructions;

  @JsonKey(name: 'strMealThumb')
  final String? strMealThumb;

  @JsonKey(name: 'strTags')
  final String? strTags;

  @JsonKey(name: 'strYoutube')
  final String? strYoutube;

  // Ingredients
  @JsonKey(name: 'strIngredient1')
  final String? strIngredient1;
  @JsonKey(name: 'strIngredient2')
  final String? strIngredient2;
  @JsonKey(name: 'strIngredient3')
  final String? strIngredient3;
  @JsonKey(name: 'strIngredient4')
  final String? strIngredient4;
  @JsonKey(name: 'strIngredient5')
  final String? strIngredient5;
  @JsonKey(name: 'strIngredient6')
  final String? strIngredient6;
  @JsonKey(name: 'strIngredient7')
  final String? strIngredient7;
  @JsonKey(name: 'strIngredient8')
  final String? strIngredient8;
  @JsonKey(name: 'strIngredient9')
  final String? strIngredient9;
  @JsonKey(name: 'strIngredient10')
  final String? strIngredient10;
  @JsonKey(name: 'strIngredient11')
  final String? strIngredient11;
  @JsonKey(name: 'strIngredient12')
  final String? strIngredient12;
  @JsonKey(name: 'strIngredient13')
  final String? strIngredient13;
  @JsonKey(name: 'strIngredient14')
  final String? strIngredient14;
  @JsonKey(name: 'strIngredient15')
  final String? strIngredient15;
  @JsonKey(name: 'strIngredient16')
  final String? strIngredient16;
  @JsonKey(name: 'strIngredient17')
  final String? strIngredient17;
  @JsonKey(name: 'strIngredient18')
  final String? strIngredient18;
  @JsonKey(name: 'strIngredient19')
  final String? strIngredient19;
  @JsonKey(name: 'strIngredient20')
  final String? strIngredient20;

  // Measures
  @JsonKey(name: 'strMeasure1')
  final String? strMeasure1;
  @JsonKey(name: 'strMeasure2')
  final String? strMeasure2;
  @JsonKey(name: 'strMeasure3')
  final String? strMeasure3;
  @JsonKey(name: 'strMeasure4')
  final String? strMeasure4;
  @JsonKey(name: 'strMeasure5')
  final String? strMeasure5;
  @JsonKey(name: 'strMeasure6')
  final String? strMeasure6;
  @JsonKey(name: 'strMeasure7')
  final String? strMeasure7;
  @JsonKey(name: 'strMeasure8')
  final String? strMeasure8;
  @JsonKey(name: 'strMeasure9')
  final String? strMeasure9;
  @JsonKey(name: 'strMeasure10')
  final String? strMeasure10;
  @JsonKey(name: 'strMeasure11')
  final String? strMeasure11;
  @JsonKey(name: 'strMeasure12')
  final String? strMeasure12;
  @JsonKey(name: 'strMeasure13')
  final String? strMeasure13;
  @JsonKey(name: 'strMeasure14')
  final String? strMeasure14;
  @JsonKey(name: 'strMeasure15')
  final String? strMeasure15;
  @JsonKey(name: 'strMeasure16')
  final String? strMeasure16;
  @JsonKey(name: 'strMeasure17')
  final String? strMeasure17;
  @JsonKey(name: 'strMeasure18')
  final String? strMeasure18;
  @JsonKey(name: 'strMeasure19')
  final String? strMeasure19;
  @JsonKey(name: 'strMeasure20')
  final String? strMeasure20;

  @JsonKey(name: 'strSource')
  final String? strSource;

  @JsonKey(name: 'strImageSource')
  final String? strImageSource;

  @JsonKey(name: 'strCreativeCommonsConfirmed')
  final String? strCreativeCommonsConfirmed;

  @JsonKey(name: 'dateModified')
  final String? dateModified;

  const ItemMealResponse({
    this.idMeal,
    this.strMeal,
    this.strMealAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strIngredient16,
    this.strIngredient17,
    this.strIngredient18,
    this.strIngredient19,
    this.strIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory ItemMealResponse.fromJson(Map<String, dynamic> json) => _$ItemMealResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMealResponseToJson(this);

  @override
  List<Object?> get props => [
        idMeal,
        strMeal,
        strMealAlternate,
        strCategory,
        strArea,
        strInstructions,
        strMealThumb,
        strTags,
        strYoutube,
        strIngredient1,
        strIngredient2,
        strIngredient3,
        strIngredient4,
        strIngredient5,
        strIngredient6,
        strIngredient7,
        strIngredient8,
        strIngredient9,
        strIngredient10,
        strIngredient11,
        strIngredient12,
        strIngredient13,
        strIngredient14,
        strIngredient15,
        strIngredient16,
        strIngredient17,
        strIngredient18,
        strIngredient19,
        strIngredient20,
        strMeasure1,
        strMeasure2,
        strMeasure3,
        strMeasure4,
        strMeasure5,
        strMeasure6,
        strMeasure7,
        strMeasure8,
        strMeasure9,
        strMeasure10,
        strMeasure11,
        strMeasure12,
        strMeasure13,
        strMeasure14,
        strMeasure15,
        strMeasure16,
        strMeasure17,
        strMeasure18,
        strMeasure19,
        strMeasure20,
        strSource,
        strImageSource,
        strCreativeCommonsConfirmed,
        dateModified,
      ];

  @override
  String toString() {
    return 'ItemMealResponse{idMeal: $idMeal, strMeal: $strMeal, strMealAlternate: $strMealAlternate, '
        'strCategory: $strCategory, strArea: $strArea, strInstructions: $strInstructions, strMealThumb: $strMealThumb, '
        'strTags: $strTags, strYoutube: $strYoutube, strIngredient1: $strIngredient1, strIngredient2: $strIngredient2, '
        'strIngredient3: $strIngredient3, strIngredient4: $strIngredient4, strIngredient5: $strIngredient5, '
        'strIngredient6: $strIngredient6, strIngredient7: $strIngredient7, strIngredient8: $strIngredient8, '
        'strIngredient9: $strIngredient9, strIngredient10: $strIngredient10, strIngredient11: $strIngredient11, '
        'strIngredient12: $strIngredient12, strIngredient13: $strIngredient13, strIngredient14: $strIngredient14, '
        'strIngredient15: $strIngredient15, strIngredient16: $strIngredient16, strIngredient17: $strIngredient17, '
        'strIngredient18: $strIngredient18, strIngredient19: $strIngredient19, strIngredient20: $strIngredient20, '
        'strMeasure1: $strMeasure1, strMeasure2: $strMeasure2, strMeasure3: $strMeasure3, strMeasure4: $strMeasure4, '
        'strMeasure5: $strMeasure5, strMeasure6: $strMeasure6, strMeasure7: $strMeasure7, strMeasure8: $strMeasure8, '
        'strMeasure9: $strMeasure9, strMeasure10: $strMeasure10, strMeasure11: $strMeasure11, strMeasure12: $strMeasure12, '
        'strMeasure13: $strMeasure13, strMeasure14: $strMeasure14, strMeasure15: $strMeasure15, strMeasure16: $strMeasure16, '
        'strMeasure17: $strMeasure17, strMeasure18: $strMeasure18, strMeasure19: $strMeasure19, strMeasure20: $strMeasure20, '
        'strSource: $strSource, strImageSource: $strImageSource, strCreativeCommonsConfirmed: $strCreativeCommonsConfirmed, '
        'dateModified: $dateModified}';
  }
}
