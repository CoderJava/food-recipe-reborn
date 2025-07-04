import 'package:dio/dio.dart';
import 'package:food_recipe/core/error/failure.dart';
import 'package:food_recipe/core/network/network_info.dart';
import 'package:food_recipe/feature/data/datasource/the_meal_db/the_meal_db_data_source.dart';
import 'package:food_recipe/feature/data/model/category/category_response.dart';
import 'package:food_recipe/feature/data/model/meal/meal_response.dart';
import 'package:food_recipe/feature/domain/repository/the_meal_db/the_meal_db_repository.dart';

class TheMealDbRepositoryImpl implements TheMealDbRepository {
  final TheMealDbDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TheMealDbRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<({Failure? failure, MealResponse? response})> getRandomMeal() async {
    Failure? failure;
    MealResponse? response;
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        response = await remoteDataSource.getRandomMeal();
      } on DioException catch (error) {
        final errorMessage = error.message ?? error.toString();
        failure = ServerFailure(errorMessage);
      } on TypeError catch (error) {
        final errorMessage = error.toString();
        failure = ParsingFailure(errorMessage);
      }
    } else {
      failure = ConnectionFailure();
    }
    return (failure: failure, response: response);
  }

  @override
  Future<({Failure? failure, CategoryResponse? response})> getCategory() async {
    Failure? failure;
    CategoryResponse? response;
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        response = await remoteDataSource.getCategory();
      } on DioException catch (error) {
        final errorMessage = error.message ?? error.toString();
        failure = ServerFailure(errorMessage);
      } on TypeError catch (error) {
        final errorMessage = error.toString();
        failure = ParsingFailure(errorMessage);
      }
    } else {
      failure = ConnectionFailure();
    }
    return (failure: failure, response: response);
  }
}
