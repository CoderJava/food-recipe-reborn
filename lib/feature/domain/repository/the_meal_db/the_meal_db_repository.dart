import 'package:food_recipe/core/error/failure.dart';
import 'package:food_recipe/feature/data/model/meal/meal_response.dart';

abstract class TheMealDbRepository {
  Future<({Failure? failure, MealResponse? response})> getRandomMeal();
}