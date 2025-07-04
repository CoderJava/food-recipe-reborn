import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/core/error/failure.dart';

void main() {
  const errorMessage = 'testErrorMessage';

  group('ServerFailure', () {
    final failure = ServerFailure(errorMessage);

    test(
      'pastikan output dari nilai props',
      () async {
        // assert
        expect(
          failure.props,
          [
            failure.errorMessage,
            failure.errorData,
          ],
        );
      },
    );

    test(
      'pastikan output dari fungsi toString',
      () async {
        // assert
        expect(
          failure.toString(),
          'ServerFailure{errorMessage: ${failure.errorMessage}, errorData: ${failure.errorData}}',
        );
      },
    );
  });

  group('ConnectionFailure', () {
    final failure = ConnectionFailure();

    test(
      'pastikan output dari nilai props',
      () async {
        // assert
        expect(
          failure.props,
          [
            failure.errorMessage,
          ],
        );
      },
    );

    test(
      'pastikan output dari fungsi toString',
      () async {
        // assert
        expect(
          failure.toString(),
          'ConnectionFailure{errorMessage: ${failure.errorMessage}}',
        );
      },
    );
  });

  group('ParsingFailure', () {
    final failure = ParsingFailure(errorMessage);

    test(
      'pastikan output dari nilai props',
      () async {
        // assert
        expect(
          failure.props,
          [
            failure.errorMessage,
            failure.defaultErrorMessage,
          ],
        );
      },
    );

    test(
      'pastikan output dari fungsi toString',
      () async {
        // assert
        expect(
          failure.toString(),
          'ParsingFailure{errorMessage: ${failure.errorMessage}, defaultErrorMessage: ${failure.defaultErrorMessage}}',
        );
      },
    );
  });
}
