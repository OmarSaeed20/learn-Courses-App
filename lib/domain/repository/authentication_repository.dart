import '../../data/model/user_model/user_model.dart';
import '/index.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultFuture<UserModel> login({
    required String password,
    required String email,
  });

  ResultFuture<List<UserEntity>> getUSer();
}
