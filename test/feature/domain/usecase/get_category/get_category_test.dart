import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/core/usecase/usecase.dart';
import 'package:food_recipe/feature/data/model/category/category_response.dart';
import 'package:food_recipe/feature/domain/usecase/get_category/get_category.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture/fixture_reader.dart';
import '../../../../helper/mock_helper.mocks.dart';

void main() {
  late GetCategory useCase;
  late MockTheMealDbRepository mockRepository;

  setUp(() {
    mockRepository = MockTheMealDbRepository();
    useCase = GetCategory(repository: mockRepository);
  });

  final tParams = NoParams();

  test(
    'pastikan objek repository berhasil menerima respon sukses atau gagal dari endpoint',
    () async {
      // arrange
      final tResponse = CategoryResponse.fromJson(
        json.decode(
          fixture('category_response.json'),
        ),
      );
      final tResult = (failure: null, response: tResponse);
      when(mockRepository.getCategory()).thenAnswer((_) async => tResult);

      // act
      final result = await useCase(tParams);

      // assert
      expect(result, tResult);
      verify(mockRepository.getCategory());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
