import 'package:equatable/equatable.dart';

import '../../../index.dart';

class SignUpUseCase extends UseCaseWithParams<void, SignUpParameter> {
  final AuthenticationRepository _repository;

  SignUpUseCase(this._repository);
  @override
  ResultVoid call(SignUpParameter params) => _repository.signUp(params);
}

class SignUpParameter extends Equatable {
  const SignUpParameter({
    required this.name,
    required this.fristName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.email,
    required this.gender,
  });
  final String name;
  final String fristName;
  final String lastName;
  final String phone;
  final String password;
  final String email;
  final int gender;
  @override
  List<Object?> get props =>
      [name, fristName, lastName, phone, password, email, gender];
}
