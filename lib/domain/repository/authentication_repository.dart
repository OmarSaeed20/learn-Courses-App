import '../../data/model/user_model/user_model.dart';
import '../usecase/sign_up_usecase.dart';
import '/index.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();
  ResultVoid  signUp(SignUpParameter parameters);

  ResultFuture<UserModel> login({
    required String password,
    required String email,
  });

  ResultFuture<List<UserEntity>> getUSer();
}
