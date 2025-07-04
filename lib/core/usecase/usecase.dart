import 'package:equatable/equatable.dart';
import 'package:food_recipe/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<({Failure? failure, Type? response})> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
