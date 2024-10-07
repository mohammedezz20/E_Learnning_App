import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error_handling.dart';


abstract class UseCase<ReturnType, Param> {
  Future<Either<Failure, ReturnType>> call([Param param]);
}

class NoParam {}
