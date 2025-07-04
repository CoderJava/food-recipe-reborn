import 'package:dio/dio.dart';
import 'package:food_recipe/config/base_url_config.dart';
import 'package:food_recipe/feature/data/model/category/category_response.dart';
import 'package:food_recipe/feature/data/model/meal/meal_response.dart';

abstract class TheMealDbDataSource {
  /// panggil endpoint [host]/random.php
  ///
  /// throws [DioException] untuk semua error kode
  late String pathGetRandomMeal;

  Future<MealResponse> getRandomMeal();

  /// panggil endpoint [host]/categories.php
  ///
  /// throws [DioException] untuk semua error kode
  late String pathGetCategory;

  Future<CategoryResponse> getCategory();
}

class TheMealDbDataSourceImpl implements TheMealDbDataSource {
  final Dio dio;

  TheMealDbDataSourceImpl({required this.dio});

  final baseUrl = BaseUrlConfig().baseUrl;

  @override
  String pathGetRandomMeal = '';

  @override
  Future<MealResponse> getRandomMeal() async {
    pathGetRandomMeal = '$baseUrl/random.php';
    final response = await dio.get(
      pathGetRandomMeal,
    );
    if (response.statusCode.toString().startsWith('2')) {
      return MealResponse.fromJson(response.data);
    } else {
      throw DioException(requestOptions: RequestOptions(path: pathGetRandomMeal));
    }
  }

  @override
  String pathGetCategory = '';

  @override
  Future<CategoryResponse> getCategory() async {
    pathGetCategory = '$baseUrl/categories.php';
    final response = await dio.get(
      pathGetCategory,
    );
    if (response.statusCode.toString().startsWith('2')) {
      return CategoryResponse.fromJson(response.data);
    } else {
      throw DioException(requestOptions: RequestOptions(path: pathGetCategory));
    }
  }
}
