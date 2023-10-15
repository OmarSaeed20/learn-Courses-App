import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int  code;

  const Failure(this.message, this.code);

  @override
  List<Object> get props => [message, code ];
}

class ApiFailure extends Failure {
  const ApiFailure(super.message, super.code);
  ApiFailure.fromEx(Failure error) : this(error.message, error.code);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message, super.code);
}
