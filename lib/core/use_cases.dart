import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/failure_handling.dart';


abstract class UseCase<ReturnType, Param> {
  Future<Either<FailureHandler, ReturnType>> call([Param param]);
}

class NoParam {}
