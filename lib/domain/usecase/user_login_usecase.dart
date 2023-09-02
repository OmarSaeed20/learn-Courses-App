import 'package:equatable/equatable.dart';
import 'package:learn/data/model/user_model/user_model.dart';

import '/index.dart';

class UserLoginUseCase
    extends UseCaseWithParams<void, CreateUserUseCaseParams> {
  const UserLoginUseCase(this._repository);
  final AuthenticationRepository _repository;

  @override
  ResultFuture<UserModel> call(CreateUserUseCaseParams params) async => _repository.login(
        email: params.email,
        password: params.paassword,
      );
}

class CreateUserUseCaseParams extends Equatable {
  const CreateUserUseCaseParams({required this.paassword, required this.email});

  final String paassword;
  final String email;

  @override
  List<Object?> get props => [paassword, email];
}
