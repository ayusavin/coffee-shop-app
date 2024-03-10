import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Exception, Type>> call(Params params);
}

class EmptyParams extends Equatable {
  @override
  List<Object?> get props => [];
}
