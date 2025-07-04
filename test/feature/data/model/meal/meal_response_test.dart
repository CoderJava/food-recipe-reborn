import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/feature/data/model/meal/meal_response.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  const pathJson = 'meal_response.json';
  final model = MealResponse.fromJson(
    json.decode(
      fixture('meal_response.json'),
    ),
  );

  test(
    'pastikan output dari nilai props',
    () async {
      // assert
      expect(
        model.props,
        [
          model.meals,
        ],
      );
    },
  );

  test(
    'pastikan output dari fungsi toString',
    () async {
      // assert
      expect(
        model.toString(),
        'MealResponse{meals: ${model.meals}}',
      );
    },
  );

  test(
    'pastikan fungsi fromJson bisa mengembalikan objek class model',
    () async {
      // arrange
      final jsonData = json.decode(fixture(pathJson));

      // act
      final actualModel = MealResponse.fromJson(jsonData);

      // assert
      expect(actualModel, model);
    },
  );

  test(
    'pastikan fungsi toJson bisa mengembalikan objek map',
    () async {
      // arrange
      final tModel = MealResponse.fromJson(
        json.decode(
          fixture(pathJson),
        ),
      );

      // act
      final actualMap = json.encode(tModel.toJson());

      // assert
      expect(actualMap, json.encode(model.toJson()));
    },
  );
}
