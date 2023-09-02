import 'package:learn/index.dart';

class GetUserUseCase extends UseCaseWithoutParams<List<UserEntity>> {
  final AuthenticationRepository _repository;

  const GetUserUseCase(this._repository);

  @override
  ResultFuture<List<UserEntity>> call() => _repository.getUSer();
}
