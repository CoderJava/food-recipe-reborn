import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:food_recipe/core/network/network_info.dart';
import 'package:food_recipe/core/util/helper.dart';
import 'package:food_recipe/core/util/shared_preferences_manager.dart';
import 'package:food_recipe/feature/data/datasource/the_meal_db/the_meal_db_data_source.dart';
import 'package:food_recipe/feature/domain/repository/the_meal_db/the_meal_db_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([
  MockSpec<Connectivity>(),
  MockSpec<NetworkInfo>(),
  MockSpec<SharedPreferences>(),
  MockSpec<SharedPreferencesManager>(),
  MockSpec<Dio>(),
  MockSpec<HttpClientAdapter>(),
  MockSpec<Helper>(),
  MockSpec<TheMealDbDataSource>(),
  MockSpec<TheMealDbRepository>(),
])
void main() {}
