import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/core/error/failure.dart';
import 'package:food_recipe/feature/data/model/category/category_response.dart';
import 'package:food_recipe/feature/data/model/meal/meal_response.dart';
import 'package:food_recipe/feature/data/repository/the_meal_db/the_meal_db_repository_impl.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture/fixture_reader.dart';
import '../../../../helper/mock_helper.mocks.dart';

void main() {
  late TheMealDbRepositoryImpl repository;
  late MockTheMealDbDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockTheMealDbDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TheMealDbRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final tRequestOptions = RequestOptions(path: '');

  void setUpMockNetworkConnected() {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
  }

  void setUpMockNetworkDisconnected() {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
  }

  void testDisconnected(Function endpointInvoke) {
    test(
      'pastikan mengembalikan objek ConnectionFailure ketika device tidak terhubung ke internet',
      () async {
        // arrange
        setUpMockNetworkDisconnected();

        // act
        final result = await endpointInvoke.call();

        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result.failure, ConnectionFailure());
      },
    );
  }

  void testServerFailureString(Function whenInvoke, Function actInvoke, Function verifyInvoke) {
    test(
      'pastikan mengembalikan objek ServerFailure ketika repository menerima respon kegagalan '
      'dari endpoint dengan respon data html atau string',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(whenInvoke.call()).thenThrow(
          DioException(
            requestOptions: tRequestOptions,
            message: 'testError',
            response: Response(
              requestOptions: tRequestOptions,
              data: 'testDataError',
              statusCode: 400,
            ),
          ),
        );

        // act
        final result = await actInvoke.call();

        // assert
        verify(verifyInvoke.call());
        expect(result.failure, ServerFailure('testError'));
      },
    );
  }

  void testParsingFailure(Function whenInvoke, Function actInvoke, Function verifyInvoke) {
    test(
      'pastikan mengembalikan objek ParsingFailure ketika RemoteDataSource menerima respon kegagalan '
      'dari endpoint',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(whenInvoke.call()).thenThrow(TypeError());

        // act
        final result = await actInvoke.call();

        // assert
        verify(verifyInvoke.call());
        expect(result.failure, ParsingFailure(TypeError().toString()));
      },
    );
  }

  group('getRandomMeal', () {
    final tResponse = MealResponse.fromJson(
      json.decode(
        fixture('meal_response.json'),
      ),
    );

    test(
      'pastikan mengembalikan objek model ketika RemoteDataSource berhasil menerima '
      'respon sukses dari endpoint',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(mockRemoteDataSource.getRandomMeal()).thenAnswer((_) async => tResponse);

        // act
        final result = await repository.getRandomMeal();

        // assert
        verify(mockRemoteDataSource.getRandomMeal());
        expect(result.response, tResponse);
      },
    );

    test(
      'pastikan mengembalikan objek ServerFailure ketika RemoteDataSource berhasil menerima '
      'respon timeout dari endpoint',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(mockRemoteDataSource.getRandomMeal())
            .thenThrow(DioException(requestOptions: tRequestOptions, message: 'testError'));

        // act
        final result = await repository.getRandomMeal();

        // assert
        verify(mockRemoteDataSource.getRandomMeal());
        expect(result.failure, ServerFailure('testError'));
      },
    );

    test(
      'pastikan mengembalikan objek ServerFailure ketika RemoteDataSource menerima respon kegagaln '
      'dari endpoint',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(mockRemoteDataSource.getRandomMeal()).thenThrow(
          DioException(
            requestOptions: tRequestOptions,
            message: 'testError',
            response: Response(
              requestOptions: tRequestOptions,
              data: {
                'title': 'testTitleError',
                'message': 'testMessageError',
              },
              statusCode: 400,
            ),
          ),
        );

        // act
        final result = await repository.getRandomMeal();

        // assert
        verify(mockRemoteDataSource.getRandomMeal());
        expect(result.failure, ServerFailure('testError'));
      },
    );

    testServerFailureString(
      () => mockRemoteDataSource.getRandomMeal(),
      () => repository.getRandomMeal(),
      () => mockRemoteDataSource.getRandomMeal(),
    );

    testParsingFailure(
      () => mockRemoteDataSource.getRandomMeal(),
      () => repository.getRandomMeal(),
      () => mockRemoteDataSource.getRandomMeal(),
    );

    testDisconnected(() => repository.getRandomMeal());
  });

  group('getCategory', () {
    final tResponse = CategoryResponse.fromJson(
      json.decode(
        fixture('category_response.json'),
      ),
    );

    test(
      'pastikan mengembalikan objek model ketika RemoteDataSource berhasil menerima '
      'respon sukses dari endpoint',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(mockRemoteDataSource.getCategory()).thenAnswer((_) async => tResponse);

        // act
        final result = await repository.getCategory();

        // assert
        verify(mockRemoteDataSource.getCategory());
        expect(result.response, tResponse);
      },
    );

    test(
      'pastikan mengembalikan objek ServerFailure ketika RemoteDataSource berhasil menerima '
      'respon timeout dari endpoint',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(mockRemoteDataSource.getCategory())
            .thenThrow(DioException(requestOptions: tRequestOptions, message: 'testError'));

        // act
        final result = await repository.getCategory();

        // assert
        verify(mockRemoteDataSource.getCategory());
        expect(result.failure, ServerFailure('testError'));
      },
    );

    test(
      'pastikan mengembalikan objek ServerFailure ketika RemoteDataSource menerima respon kegagaln '
      'dari endpoint',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(mockRemoteDataSource.getCategory()).thenThrow(
          DioException(
            requestOptions: tRequestOptions,
            message: 'testError',
            response: Response(
              requestOptions: tRequestOptions,
              data: {
                'title': 'testTitleError',
                'message': 'testMessageError',
              },
              statusCode: 400,
            ),
          ),
        );

        // act
        final result = await repository.getCategory();

        // assert
        verify(mockRemoteDataSource.getCategory());
        expect(result.failure, ServerFailure('testError'));
      },
    );

    testServerFailureString(
      () => mockRemoteDataSource.getCategory(),
      () => repository.getCategory(),
      () => mockRemoteDataSource.getCategory(),
    );

    testParsingFailure(
      () => mockRemoteDataSource.getCategory(),
      () => repository.getCategory(),
      () => mockRemoteDataSource.getCategory(),
    );

    testDisconnected(() => repository.getCategory());
  });
}
