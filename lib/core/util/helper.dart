import 'package:food_recipe/core/error/failure.dart';
import 'package:food_recipe/core/util/shared_preferences_manager.dart';
import 'package:intl/intl.dart';

class Helper {
  final SharedPreferencesManager sharedPreferencesManager;

  Helper({required this.sharedPreferencesManager});

  DateFormat setDateFormat(String pattern, {String? languageCode}) {
    if (languageCode != null) {
      return DateFormat(pattern, languageCode);
    }
    return DateFormat(pattern, 'en');
  }

  String getErrorMessageFromFailure(Failure? failure) {
    switch (failure) {
      case ServerFailure():
        return failure.errorMessage;
      case ConnectionFailure():
        return failure.errorMessage;
      case ParsingFailure():
        return failure.defaultErrorMessage;
      default:
        return ConstantErrorMessage().failureUnknown;
    }
  }
}
