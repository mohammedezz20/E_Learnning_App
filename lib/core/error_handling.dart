import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];

  @override
  String toString();
}

class ServerFailure implements Failure {
  String message;
  ServerFailure({
    required this.message,
  });
  @override
  List<Object> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return message;
  }

  @override
  // TODO: implement stringify
  bool? get stringify => EquatableConfig.stringify;
}

class CacheFailure implements Failure {
  String message;
  CacheFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
  @override
  String toString() {
    // TODO: implement toString
    return message;
  }

  @override
  bool? get stringify => throw UnimplementedError();
}

class SystemFailure implements Failure {
  String message;
  SystemFailure({
    required this.message,
  });

  @override
  // TODO: implement props
  List<Object> get props => [];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
