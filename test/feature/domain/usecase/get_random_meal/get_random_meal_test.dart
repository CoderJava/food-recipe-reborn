import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/core/usecase/usecase.dart';
import 'package:food_recipe/feature/data/model/meal/meal_response.dart';
import 'package:food_recipe/feature/domain/usecase/get_random_meal/get_random_meal.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture/fixture_reader.dart';
import '../../../../helper/mock_helper.mocks.dart';

void main() {
  late GetRandomMeal useCase;
  late MockTheMealDbRepository mockRepository;

  setUp(() {
    mockRepository = MockTheMealDbRepository();
    useCase = GetRandomMeal(repository: mockRepository);
  });

  final tParams = NoParams();

  test(
    'pastikan objek repository berhasil menerima respon sukses atau gagal dari endpoint',
    () async {
      // arrange
      final tResponse = MealResponse.fromJson(
        json.decode(
          fixture('meal_response.json'),
        ),
      );
      final tResult = (failure: null, response: tResponse);
      when(mockRepository.getRandomMeal()).thenAnswer((_) async => tResult);

      // act
      final result = await useCase(tParams);

      // assert
      expect(result, tResult);
      verify(mockRepository.getRandomMeal());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
