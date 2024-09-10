import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error_handling.dart';


abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}
